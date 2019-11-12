FROM alpine:3

ENV VERSION=0.12.13
ENV ARCH=amd64
ENV BASE_URL=https://releases.hashicorp.com/terraform/${VERSION}
ENV ZIP_FILE=terraform_${VERSION}_linux_${ARCH}.zip

RUN wget ${BASE_URL}/${ZIP_FILE} && \
    unzip ${ZIP_FILE} && \
    mv terraform /usr/bin/terraform && \
    chmod +x /usr/bin/terraform && \
    rm -rf ${ZIP_FILE}

WORKDIR /apps

ENTRYPOINT ["terraform"]
CMD ["--help"]


# VERSION=0.12.13 ARCH=amd64 BASE_URL=https://releases.hashicorp.com/terraform/${VERSION}/ ZIP_FILE=terraform_${VERSION}_linux_${ARCH}.zip wget ${BASE_URL}/${ZIP_FILE} && unzip ${ZIP_FILE}