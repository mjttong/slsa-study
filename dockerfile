FROM golang:1.25.2-alpine3.22 AS builder
WORKDIR /app
COPY main.go .
RUN go build -o server main.go

FROM alpine
COPY --from=builder /app/server /server
EXPOSE 8080
CMD ["/server"]
