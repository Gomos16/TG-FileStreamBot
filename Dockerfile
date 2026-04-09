FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o fsb .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/fsb .
CMD ["./fsb", "run"]
