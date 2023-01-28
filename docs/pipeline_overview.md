This project keeps to a strict CI and CD methodology to ensure efficient development. The two
are kept distinct to ensure separation of concerns.

## Continuous Integration: CircleCI

Configuration is in the [.circleci](../.circleci) directory.

On new push to main,

- Lint Python, [Black](https://black.readthedocs.io/en/stable/)
- Test Python
- Test Terraform
- Code security scan in [Snyk](https://snyk.io/)
- Code smells scan in [SonarCloud](https://sonarcloud.io/)
- Build artifacts
    - Terraform plan
    - Container for Python code
    - Zip for HTML code

If all the above succeeds, create GitHub release.

## Continuous Deployment: Harness

Configuration is in the [.harness](../.harness) directory.

On new GitHub release,

- Execute Terraform plan
- Deploy HTML files to bucket
- Deploy latest container to AWS Lambda