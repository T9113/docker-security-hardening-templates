FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o main .

FROM gcr.io/distroless/static-debian12
COPY --from=builder /app/main /
USER 10001:10001
ENTRYPOINT ["/main"]
