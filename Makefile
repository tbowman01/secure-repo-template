ARTIFACT_DIR := artifacts

.PHONY: all scan-all prd trivy gitleaks trufflehog syft sbom owasp codeql clean act gh-cli codeql-cli containers

# Run all scans
all: scan-all

scan-all: trivy gitleaks trufflehog syft owasp
	@echo "Completed all scans."

# Generate the product requirements document using Claude‑Flow
prd:
	npm install -g claude-flow
	npx claude-flow task orchestrate --file orchestrate-workflow.js --strategy balanced --max-concurrent 8

# Trivy filesystem scan
trivy:
	mkdir -p $(ARTIFACT_DIR)
	trivy fs . --format json --output $(ARTIFACT_DIR)/trivy-results.json

# gitleaks secrets scan
gitleaks:
	mkdir -p $(ARTIFACT_DIR)
	gitleaks detect --source . --report-format json --report-path $(ARTIFACT_DIR)/gitleaks.json

# trufflehog secrets scan
trufflehog:
	mkdir -p $(ARTIFACT_DIR)
	trufflehog filesystem . --json > $(ARTIFACT_DIR)/trufflehog.json

# Syft SCA scan
syft:
	mkdir -p $(ARTIFACT_DIR)
	syft dir:. -o json > $(ARTIFACT_DIR)/sca.json

# Syft SBOM generation
sbom:
	mkdir -p $(ARTIFACT_DIR)
	syft dir:. -o spdx-json > $(ARTIFACT_DIR)/sbom.spdx.json

# OWASP Dependency‑Check scan
owasp:
	mkdir -p $(ARTIFACT_DIR)
	dependency-check.sh --project secure-repo-template --scan . --format JSON --out $(ARTIFACT_DIR)
	mv $(ARTIFACT_DIR)/*dependency-check-report.json $(ARTIFACT_DIR)/owasp-report.json

# Clean artefacts
clean:
	rm -rf $(ARTIFACT_DIR)

# Run GitHub Actions locally with act
act:
	act

# Check GitHub CLI authentication
gh-cli:
	gh auth status || true

# Check CodeQL CLI installation
codeql-cli:
	codeql version || echo "Install CodeQL CLI to use this target"

# Build scanner containers
containers:
	docker build -f docker/trivy.Dockerfile -t secure-scanner/trivy .
	docker build -f docker/gitleaks.Dockerfile -t secure-scanner/gitleaks .
	docker build -f docker/owasp.Dockerfile -t secure-scanner/owasp .
	docker build -f docker/codeql.Dockerfile -t secure-scanner/codeql .
	docker build -f docker/full.Dockerfile -t secure-scanner/full .
