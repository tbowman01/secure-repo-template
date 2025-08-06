FROM alpine:3.18
RUN apk add --no-cache wget ca-certificates tar jq
RUN wget -qO- https://github.com/aquasecurity/trivy/releases/latest/download/trivy_$(uname -m)_linux.tar.gz | \
  tar -xz -C /usr/local/bin --strip=1
ENTRYPOINT ["trivy"]
