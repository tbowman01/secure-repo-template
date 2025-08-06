FROM maven:3.9.2-jdk-17
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*
ENV DC_VERSION=8.4.0
RUN wget -O dependency-check.zip https://github.com/jeremylong/DependencyCheck/releases/download/v${DC_VERSION}/dependency-check-${DC_VERSION}-release.zip \
  && unzip dependency-check.zip \
  && rm dependency-check.zip \
  && ln -s dependency-check/bin/dependency-check.sh /usr/local/bin/dependency-check.sh
ENTRYPOINT ["/usr/local/bin/dependency-check.sh"]
