# Secure Repository Template

This repository provides a ready‑to‑use template for building secure software projects on GitHub.  It combines an AI‑driven product requirements workflow with a comprehensive set of security and compliance checks.  Use this template to bootstrap new projects with built‑in scanning, CI/CD automation, and developer tooling.

## Features

- **Product Requirements Generation** – Automatically analyze your repository and generate a product requirements document using GPT‑4o via the Claude‑Flow orchestration engine.
- **Software Composition Analysis (SCA)** – Detect third‑party dependencies and vulnerabilities with [Syft](https://github.com/anchore/syft).  Generate both an SBOM and a traditional SCA report.
- **Static Application Security Testing (SAST)** – Run [GitHub CodeQL](https://docs.github.com/en/code-security/code-scanning) against your source code and upload results to the GitHub Security Dashboard.
- **Secrets Scanning** – Detect hard‑coded secrets with [gitleaks](https://github.com/gitleaks/gitleaks) and [trufflehog](https://github.com/trufflesecurity/trufflehog).
- **Vulnerability Scanning** – Use [Trivy](https://github.com/aquasecurity/trivy) to scan your entire file system for CVEs and misconfigurations.
- **OWASP Dependency‑Check** – Identify vulnerable dependencies using OWASP’s dependency‑check.
- **Containerized Tooling** – Dockerfiles provided for each scanner as well as a full image that includes all tools.
- **Local Development** – A devcontainer definition and a versatile `Makefile` let you reproduce the CI pipeline locally, including running GitHub Actions with [`act`](https://github.com/nektos/act).
- **GitHub Hardening** – OpenSSF Scorecard and Allstar configurations enforce branch protection, code review, and other security best practices.
- **Automatic Wiki Publication** – Changes to the `wiki/` folder automatically update the repository’s GitHub Wiki via a dedicated workflow.

## Quick Start

1. Click the **Use this template** button on the repository home page to create a new project based on this template.
2. Install development dependencies:

   ```sh
   npm install -g claude-flow
   ```

3. Trigger the default GitHub Action by pushing to the `main` branch.  This will run all scans and create a `docs/product_requirements.md` file.

For detailed instructions and tool documentation, visit the [project wiki](https://github.com/tbowman01/secure-repo-template/wiki).
