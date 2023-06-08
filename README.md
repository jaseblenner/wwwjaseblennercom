# wwwjaseblennercom

## Intention

This repo is used as an example/guide when facilitating educational workshops.

This repo is intended to showcase a simple example of how app and serverless infrastructure codebases can be housed together and managed from a single repository.

The services deployed and managed by this repo (eg. in GitHub, Terraform Cloud and Cloudflare) incur no cost - they are free to run.


## Overview

This repo is manages both the infrastructure and application codebases for the [`www.jaseblenner.com`](www.jaseblenner.com) landing page

Our (web) application Next.JS/React codebase is housed in the `./app/` folder - any changes to this codebase on the `main` branch will trigger a production deployment against the Cloudflare Pages Project named `wwwjaseblennercom` - for this reason, the `main` branch has branch protection enabled.

Any changes made to **any** other branch will trigger a development deployment against the same Cloudflare Pages Project

Our infrastructure code is housed in the root (top level) of the repository. Any changes to this codebase on the `main` branch will trigger a speculative terraform plan against the Terraform Cloud workspace of the same name as a VCS connection has been configured on the Terraform Cloud Workspace. Note that all changes to `main` must be merged by way of an approved PR.

Local basic pre-commit and linting checks (mainly for terraform) have been configured in the `.pre-commit-config.yaml` file - note that there is a dependency to have the required pre-commit linters and dependencies installed locally for these to run successfully. Example only.
A better way to do this would be to leverage [GitHub Actions](https://github.com/features/actions) to perform these.

The `./.github/CODEOWNERS` CODEOWNERS file to define individuals or teams that are responsible for code in a repository

## References

- [Next JS / React](https://nextjs.org/learn/basics/create-nextjs-app)
- [Terraform Workspaces / VCS](https://developer.hashicorp.com/terraform/cloud-docs/vcs)
- [Cloudflare Pages](https://pages.cloudflare.com/)
- [Cloudflare DNS](https://developers.cloudflare.com/dns/)
- [GitHub pre-commit](https://github.com/pre-commit/pre-commit)
- [GitHub CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
