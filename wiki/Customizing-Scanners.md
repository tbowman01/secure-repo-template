# Customizing Scanners

This template is designed to be extensible.  Below are some common ways to tailor the scanning tools to your project's needs.

## CodeQL

By default the workflow initializes CodeQL for JavaScript.  To scan other languages, update the `languages` field in `.github/workflows/full-security-prd.yml` under the `sast-codeql` job:

```yaml
with:
  languages: javascript,python
```

## gitleaks and TruffleHog

Both secrets scanners use sensible defaults.  To customize the rules:

- For **gitleaks**, create a configuration file `.gitleaks.toml` and add `--config=.gitleaks.toml` to the gitleaks command in the workflow.
- For **trufflehog**, you can specify detectors and entropy thresholds with CLI flags.  See the [trufflehog documentation](https://trufflesecurity.com/docs/) for details.

## Trivy

Trivy can scan Docker images, SBOMs and Kubernetes manifests.  Modify the command in the workflow or `Makefile` to use modes other than `fs`.

## OWASP Dependency‑Check

Dependency‑Check supports multiple output formats and suppression files.  Use the `format` and `suppressions-file` options in the workflow.

## Adding New Tools

Add additional tools by defining new jobs in the workflow and corresponding targets in the `Makefile`.  Ensure each new job has `continue-on-error: true` so that a failure does not block other scans.
