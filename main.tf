# define our dns zone
locals {
  dns_zone_name = "jaseblenner.com"
  github_owner  = "jaseblenner"       # name of our github account/org which our pages project codebase belongs to
  github_repo   = "wwwjaseblennercom" # name ofthe github repo which our cloudflare pages project codebase belongs to
}

# retrieve info from the (existing) dns zone in cloudflare
data "cloudflare_zone" "zone" {
  name = local.dns_zone_name
}

# Create Cloudflare Pages project
resource "cloudflare_pages_project" "wwwjaseblennercom" {
  account_id        = var.cloudflare_master_account_id
  name              = var.project_name
  production_branch = "main"

  source {
    type = "github"
    config {
      owner               = local.github_owner
      repo_name           = local.github_repo
      production_branch   = "main"
      pr_comments_enabled = true
      deployments_enabled = true
      # we dont auto deploy to our production domain (ie. jaseblenner.com)
      production_deployment_enabled = false
      # we deploy to our dev domain from all branches except "main"
      preview_deployment_setting = "custom"
      preview_branch_excludes    = ["main"]
      preview_branch_includes    = ["*"]
    }
  }

  build_config {
    build_command   = "npm run build"
    destination_dir = "out"
    root_dir        = "app"
  }

  deployment_configs {
    preview {
      environment_variables = {
        NODE_VERSION = "17"
      }
    }
    production {
      environment_variables = {
        NODE_VERSION = "17"
      }
    }
  }
}

## Associate our Cloudflare Pages Project with our existing (jaseblenner.com) domain
resource "cloudflare_pages_domain" "wwwjaseblennercom" {
  account_id   = var.cloudflare_master_account_id
  project_name = var.project_name
  domain       = data.cloudflare_zone.zone.name
}

## Point our root domain at the cloudflare pages CNAME
resource "cloudflare_record" "jaseblennercom" {
  zone_id = data.cloudflare_zone.zone.zone_id
  name    = "@"
  value   = cloudflare_pages_project.wwwjaseblennercom.subdomain
  type    = "CNAME"
  ttl     = 60
}

## Redirect www to our domain apex
## Ref: https://developers.cloudflare.com/pages/how-to/www-redirect/
resource "cloudflare_record" "wwwjaseblennercom" {
  zone_id = data.cloudflare_zone.zone.zone_id
  name    = "www"
  value   = "192.0.2.1"
  type    = "A"
  ttl     = 1
  proxied = true
}

# Redirect http to https
resource "cloudflare_ruleset" "wwwjaseblennercom" {
  zone_id = data.cloudflare_zone.zone.zone_id
  name    = "www_redirect_to_https"
  kind    = "zone"
  phase   = "http_request_dynamic_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          value = "https://${cloudflare_record.jaseblennercom.hostname}"
        }
        preserve_query_string = true
      }
    }
    expression  = "(http.host eq \"${cloudflare_record.wwwjaseblennercom.hostname}\")"
    description = "Redirect ${cloudflare_record.wwwjaseblennercom.hostname} to https://${cloudflare_record.jaseblennercom.hostname}"
    enabled     = true
  }
}
