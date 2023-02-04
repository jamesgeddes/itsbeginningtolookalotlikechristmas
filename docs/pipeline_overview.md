This project keeps to a strict CI and CD methodology to ensure efficient development. The two
are kept distinct to ensure separation of concerns.

## Continuous Integration

### CircleCI

Configuration is in the [.circleci](../.circleci) directory.

On new push to `main:static`,

- Build artifacts
    - Zip HTML code
- Publish artifacts
    - HTML ZIP to Artifactory

On new push to `main:src`

- Lint Python, [Black](https://black.readthedocs.io/en/stable/)
- Test Python
- Code security scan in [Snyk](https://snyk.io/)
- Code smells scan in [SonarCloud](https://sonarcloud.io/)
- Build artifacts
    - Container for Python code
- Publish artifacts
    - Container
      to [Dockerhub](https://hub.docker.com/repository/docker/jamesgeddes/itsbeginningtolookalotlikechristmas)

## Continuous Deployment

### Terraform cloud

Configuration is in the [terraform](../terraform) directory.

On new push to `main:terraform`, plan and apply infrastructure changes.

### Harness

Configuration is in the [.harness](../.harness) directory.

On new container in dockerhub

- Execute Terraform plan
- Deploy HTML files to bucket
- Deploy latest container to AWS Lambda
