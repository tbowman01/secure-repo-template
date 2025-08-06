// Orchestration definition for Claude‑Flow

module.exports = {
  name: "GPT-4o Repo Analysis + SBOM + Security Scans",
  subtasks: [
    {
      id: "repo_analysis",
      agent: "gpt-4o",
      model: "gpt-4o",
      task: "Analyze the codebase for structure, complexity, and modules"
    },
    {
      id: "prd_generator",
      agent: "gpt-4o",
      model: "gpt-4o",
      task: "Generate a product requirements document from repo analysis"
    },
    {
      id: "save_prd",
      agent: "fs-agent",
      task: "Write the PRD to docs/product_requirements.md"
    },
    {
      id: "sca_scan",
      agent: "local-script",
      task: "Run Syft SCA and save output to artifacts/sca.json"
    },
    {
      id: "sast_scan",
      agent: "local-script",
      task: "Run CodeQL scan and generate SARIF"
    },
    {
      id: "upload_codeql",
      agent: "gh-upload",
      task: "Upload CodeQL SARIF to GitHub Security Dashboard"
    },
    {
      id: "sbom_generation",
      agent: "local-script",
      task: "Generate SBOM using Syft and save to artifacts/sbom.spdx.json"
    },
    {
      id: "secrets_scan",
      agent: "local-script",
      task: "Run gitleaks and trufflehog secret scans and save reports to artifacts"
    },
    {
      id: "trivy_scan",
      agent: "local-script",
      task: "Run Trivy filesystem scan on project and output JSON to artifacts/trivy-results.json"
    },
    {
      id: "owasp_scan",
      agent: "local-script",
      task: "Run OWASP Dependency-Check and save report to artifacts/owasp-report.json"
    }
  ],
  dependencies: [
    { from: "repo_analysis", to: "prd_generator" },
    { from: "prd_generator", to: "save_prd" },
    { from: "sast_scan", to: "upload_codeql" }
  ],
  strategy: "balanced",
  maxConcurrent: 8
};
