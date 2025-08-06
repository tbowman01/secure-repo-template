# Scan Tool Overview

This template integrates multiple scanning tools.  Each tool runs in its own job in the GitHub Actions workflow and can also be executed locally through the Makefile.

| Tool | Purpose | Output |
|---|---|---|
| **Syft** | Software Composition Analysis (SCA), enumerates packages and generates a bill of materials | `artifacts/sca.json`, `artifacts/sbom.spdx.json` |
| **CodeQL** | Static Application Security Testing (SAST) using GitHub's CodeQL engine | SARIF results uploaded to the GitHub Security Dashboard |
| **gitleaks** | Detects hard‑coded secrets using regex and entropy rules | `artifacts/gitleaks.json` |
| **trufflehog** | Searches for secrets and keys via entropy and heuristics | `artifacts/trufflehog.json` |
| **Trivy** | Scans the filesystem for vulnerabilities and misconfigurations | `artifacts/trivy-results.json` |
| **OWASP Dependency Check** | Identifies vulnerable dependencies using the National Vulnerability Database | `artifacts/owasp/dependency-check-report.json` |

See the GitHub Action definition in `.github/workflows/full-security-prd.yml` for details on how each tool is invoked.
