FROM alpine:3.16
RUN apk --no-cache upgrade && \
    apk add -U --no-cache socat
COPY entry /usr/bin/
CMD ["entry"]