FROM rust:1.63.0-slim-bullseye AS builder
RUN apt update && apt install -yq libssl-dev pkg-config && cargo install cargo-audit --features fix

FROM debian:bullseye-slim
# FROM gcr.io/distroless/cc
RUN apt update && apt install -yq libssl-dev ca-certificates && update-ca-certificates
COPY --from=builder /usr/local/cargo/bin/cargo-audit /usr/local/bin/cargo-audit
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT  ["/entrypoint.sh"]
