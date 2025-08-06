FROM alpine:3.18
RUN apk add --no-cache curl
RUN curl -sSL https://github.com/gitleaks/gitleaks/releases/latest/download/gitleaks-linux-amd64 -o /usr/local/bin/gitleaks \
  && chmod +x /usr/local/bin/gitleaks
ENTRYPOINT ["gitleaks"]
