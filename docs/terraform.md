Terraform is used to configure AWS infrastructure. Here, we have used Terraform cloud on a VCS
workflow, automatically applying whenever changes are made to the `/terraform` directory.

## Decision-making process

Terraform cloud was chosen as it removes the brainpower normally needed to manage Terraform
state. Additionally, for open source projects, it costs £0 so why not.

## Application maintenance

Terraform requires the following credentials.

- DOCKER_USERNAME
- DOCKER_PASSWORD
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY

Here, they were set in the Terraform Cloud environment variables.
