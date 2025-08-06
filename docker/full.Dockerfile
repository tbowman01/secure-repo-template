FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    python3 \
    python3-pip \
    git \
    jq \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Node 20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs \
  && npm install -g claude-flow

# Install Syft
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/local/bin

# Install gitleaks
RUN curl -sSL https://github.com/gitleaks/gitleaks/releases/latest/download/gitleaks-linux-amd64 -o /usr/local/bin/gitleaks \
  && chmod +x /usr/local/bin/gitleaks

# Install trufflehog
RUN pip install trufflehog

# Install Trivy
RUN wget -qO- https://github.com/aquasecurity/trivy/releases/latest/download/trivy_$(uname -m)_linux.tar.gz | tar -xz -C /usr/local/bin --strip=1

# Install OWASP Dependency Check
ENV DC_VERSION=8.4.0
RUN wget -O dependency-check.zip https://github.com/jeremylong/DependencyCheck/releases/download/v${DC_VERSION}/dependency-check-${DC_VERSION}-release.zip \
  && unzip dependency-check.zip \
  && rm dependency-check.zip \
  && ln -s dependency-check/bin/dependency-check.sh /usr/local/bin/dependency-check.sh

# Install CodeQL
RUN curl -sL -o codeql.zip https://github.com/github/codeql-cli-binaries/releases/latest/download/codeql-linux64.zip \
  && unzip codeql.zip -d /opt/codeql \
  && rm codeql.zip \
  && ln -s /opt/codeql/codeql /usr/local/bin/codeql

# Install GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
COPY . /workspace
ENTRYPOINT ["/bin/bash"]
