# Terraform Github Repo module

## Build Status

[![CircleCI](https://circleci.com/gh/rb-org/terraform-aws-rb-github/tree/master.svg?style=svg&circle-token=ae243ef5df0c7114d817724a928e4fb1b2899c4f)](https://circleci.com/gh/rb-org/terraform-aws-rb-github/tree/master)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| github\_token |  | string | n/a | yes |
| repo\_description |  | string | n/a | yes |
| repo\_name |  | string | n/a | yes |
| team\_count |  | string | n/a | yes |
| teams |  | list | n/a | yes |
| allow\_merge\_commit |  | string | `"true"` | no |
| allow\_rebase\_merge |  | string | `"true"` | no |
| allow\_squash\_merge |  | string | `"true"` | no |
| auto\_init |  | string | `"true"` | no |
| circleci\_token |  | string | `""` | no |
| contexts |  | list | `<list>` | no |
| dismiss\_stale\_reviews |  | string | `"true"` | no |
| dismissal\_teams |  | list | `<list>` | no |
| dismissal\_users |  | list | `<list>` | no |
| enable\_branch\_protection |  | string | `"false"` | no |
| enforce\_admins |  | string | `"true"` | no |
| github\_org |  | string | `""` | no |
| gitignore\_template |  | string | `"Terraform"` | no |
| has\_issues |  | string | `"true"` | no |
| has\_wiki |  | string | `"true"` | no |
| license\_template |  | string | `"mit"` | no |
| private\_repo |  | string | `"true"` | no |
| strict\_status\_checks |  | string | `"true"` | no |
| update\_circleci |  | string | `"false"` | no |
| vcs |  | string | `"github"` | no |

## Outputs

| Name | Description |
|------|-------------|
| ssh\_clone\_url |  |
| ssh\_clone\_url\_no\_cci |  |