# Contributing

Thank you for your interest in contributing to this project!  We welcome pull requests, bug reports, and feature requests.

## Development Setup

1. Fork this repository and clone your fork.
2. Install Node 20 LTS and [Docker](https://docs.docker.com/get-docker/).
3. Run `make scan-all` to execute all local security scans.  Fix any findings before submitting a pull request.
4. Run `make prd` to regenerate the product requirements document.

## Pull Request Process

- Please describe the problem you are solving and link to any related issues.
- Ensure your changes pass all GitHub Actions workflows.
- Run the local scans (`make scan-all`) and resolve any failures.
- Follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## Bug Reports and Feature Requests

Use the issue templates under `.github/ISSUE_TEMPLATE` to file bugs or propose new features.  Provide as much detail as possible, including reproduction steps and desired outcomes.
