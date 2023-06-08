# wwwjaseblennercom

## Intention

This repo is intended to provide a simple example of how app and serverless infrastructure codebases can be housed together and managed from a single repository.

The services deployed and managed by this repo incur no cost - they are free to run.

## Overview

This repo is manages both the infrastructure and application codebases for the [`www.jaseblenner.com`](www.jaseblenner.com) landing page

Our (web) application Next.JS/React codebase is housed in the `./app/` folder - any changes to this codebase on the `main` branch will trigger a production deployment against the Cloudflare Pages Project named `wwwjaseblennercom` - for this reason, the `main` branch has branch protection enabled.

Any changes made to **any** other branch will trigger a development deployment against the same Cloudflare Pages Project

Our infrastructure code is housed in the root (top level) of the repository. Any changes to this codebase on the `main` branch will trigger a speculative terraform plan against the Terraform Cloud workspace of the same name. Note that all changes to main must be merged by way of an approved PR.

Local basic pre-commit and linting checks have been configured in the `.pre-commit-config.yaml` file


## References

- [Next JS / React](https://nextjs.org/learn/basics/create-nextjs-app)
- [Terraform Workspaces / VCS](https://developer.hashicorp.com/terraform/cloud-docs/vcs)
- [Cloudflare Pages](https://pages.cloudflare.com/)
- [Cloudflare DNS](https://developers.cloudflare.com/dns/)
