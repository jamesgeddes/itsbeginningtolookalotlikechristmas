The directory structure of this projects is as follows.

```
├── .circleci
├── .harness
├── docs
├── src
├── static
│   ├── css
│   ├── img
│   └── js
│       └── vendor
└── terraform
    └── policy
```

- .circleci<br />
  CI pipeline configuration
- .harness<br />
  CD pipeline configuration
- docs<br />
  Stores all the documentation. You are here.
- src<br />
  Contains Python application source code. Gets song popularity from Spotify and stores it in S3.
- static<br />
  HTML used to show the [frontend](frontend.md)
- terraform
  Contains [Terraform](terraform.md) AWS infrastructure configuration.