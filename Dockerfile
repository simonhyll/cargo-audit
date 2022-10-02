FROM rust:1.63.0-slim-bullseye AS builder
RUN apt update && apt install -yq libssl-dev pkg-config && cargo install cargo-audit --features fix

FROM gcr.io/distroless/cc:nonroot
#WORKDIR /app
COPY --from=builder --chown=nonroot:nonroot /usr/local/cargo/bin/cargo-audit /usr/local/bin/cargo-audit
ENTRYPOINT  ["/usr/local/bin/cargo-audit", "audit", "--db", ".cargo/audit", "fix"]
