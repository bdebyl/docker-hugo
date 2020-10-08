FROM alpine:latest
MAINTAINER Bastian de Byl <bastian@bdebyl.net>

ENV HUGO_DIR /usr/local/hugo
ENV HUGO_BIN_DIR /usr/local/bin

RUN apk add --no-cache curl wget git

RUN mkdir ${HUGO_DIR} && \
    export HUGO_URL="$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | awk '/browser_download_url.*Linux-64bit.tar.gz/{print $2}' | tr -d '"')" && \
    wget "$HUGO_URL" -P ${HUGO_DIR}

RUN apk del curl wget && \
    rm -rf /var/cache/apk/*

RUN find ${HUGO_DIR} -name "hugo*.tar.gz" -exec tar xzvf {} -C ${HUGO_DIR} \; -exec rm -v {} \; \
    && ln -s ${HUGO_DIR}/hugo ${HUGO_BIN_DIR}

VOLUME ["/src"]
WORKDIR /src

EXPOSE 1313
ENTRYPOINT ["hugo"]
