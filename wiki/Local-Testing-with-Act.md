# Local Testing with `act`

[`act`](https://github.com/nektos/act) is a tool that allows you to run GitHub Actions workflows locally.  This template’s Makefile includes an `act` target for convenience.

## Prerequisites

- Docker must be installed on your machine.
- You should have [act installed](https://github.com/nektos/act#installation) (`brew install act` on macOS).

## Running Jobs Locally

To run the entire workflow locally:

```sh
make act
```

To run a specific job (e.g. the Trivy scan):

```sh
act -j trivy-scan
```

Running locally can help you iterate on workflow logic without consuming CI minutes.
