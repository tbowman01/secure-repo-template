FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl unzip git && rm -rf /var/lib/apt/lists/*
RUN curl -sL -o codeql.zip https://github.com/github/codeql-cli-binaries/releases/latest/download/codeql-linux64.zip \
  && unzip codeql.zip -d /opt/codeql \
  && rm codeql.zip \
  && ln -s /opt/codeql/codeql /usr/local/bin/codeql
ENTRYPOINT ["codeql"]
