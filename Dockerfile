FROM dtzar/helm-kubectl:3.10.3

ARG VCS_REF
ARG BUILD_DATE
ARG SOPS_VERSION

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="helm-secrets" \
      org.label-schema.url="https://hub.docker.com/r/dteamdev/helm-secrets/" \
      org.label-schema.vcs-url="https://github.com/dteamdev/helm-secrets" \
      org.label-schema.build-date=$BUILD_DATE

RUN apk add --no-cache ca-certificates bash git openssh curl jq bind-tools \
    && wget -q https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux -O /usr/local/bin/sops \
    && chmod +x /usr/local/bin/sops \
    && helm plugin install https://github.com/jkroepke/helm-secrets