FROM alpine:latest
RUN apk add --no-cache ca-certificates

ADD https://github.com/pocketbase/pocketbase/releases/download/v0.22.9/pocketbase_0.22.9_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /app/ && \
    chmod +x /app/pocketbase && \
    rm /tmp/pb.zip

EXPOSE 8080

CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb/pb_data"]
