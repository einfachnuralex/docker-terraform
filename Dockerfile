FROM alpine:3

ENV VERSION=0.12.13
ENV ARCH=amd64
ENV BASE_URL=https://releases.hashicorp.com/terraform/${VERSION}/
ENV ZIP_FILE=terraform_${VERSION}_linux_${ARCH}.zip

RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${BASE_URL}/${ZIP_FILE} -o ${ZIP_FILE} && \
    unzip ${ZIP_FILE} && \
    mv terraform /usr/bin/terraform && \
    chmod +x /usr/bin/terraform && \
    rm -rf ${ZIP_FILE} && \
    apk del curl && \
    rm -f /var/cache/apk/*

WORKDIR /apps

ENTRYPOINT ["terraform"]
CMD ["--help"]