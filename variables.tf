variable "tfc_org" {
  type        = string
  description = "terraform cloud organization name"
  default     = null
}

variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "cloudflare api token - stored as a sensitive variable in global cloudflare variable set in tfc"
  default     = null
}

variable "cloudflare_master_account_id" {
  type        = string
  description = "cloudflare account id - stored in global cloudflare variable set in tfc"
  default     = null
}

variable "project_name" {
  type        = string
  description = "name of our project"
  default     = "wwwjaseblennercom"
}
