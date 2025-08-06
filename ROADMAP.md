# Roadmap and Configuration

This document tracks the status of security and automation features for the Secure Supply Chain Scanner Template.

## Completed

- Initial scaffolding of GitHub Actions workflow for product requirements generation and parallel scanning.
- Integration of gitleaks, trufflehog, Syft SCA/SBOM, Trivy, OWASP dependency‑check and CodeQL.
- Configuration for Allstar and OpenSSF Scorecard.
- Dockerfiles for each scanner and a combined image.
- Devcontainer definition and local development Makefile.
- Automatic wiki publication workflow.

## In Progress

- Add a GitHub Action to run the OpenSSF Scorecard (`ossf/scorecard-action`) and publish results.
- Evaluate additional static analysis tools (e.g. Semgrep) for future integration.
- Investigate support for scanning container images and Kubernetes manifests.

## Next Steps

- Customize Scorecard thresholds and update `.scorecard.yml` as your security maturity evolves.
- Onboard the Allstar GitHub App to your organization and monitor enforcement results.
- Regularly update scanner versions in the workflow and Dockerfiles.
- Extend the documentation in the `wiki/` directory with project‑specific guidance.
