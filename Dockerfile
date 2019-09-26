FROM alpine:3.10.2
MAINTAINER Bastian de Byl <bastian@bdebyl.net>

ENV HUGO_DIR /usr/local/hugo
ENV HUGO_BIN_DIR /usr/local/bin
ENV HUGO_RELEASE_VER 0.58.3

RUN mkdir ${HUGO_DIR}
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_RELEASE_VER}/hugo_${HUGO_RELEASE_VER}_Linux-64bit.tar.gz ${HUGO_DIR}
RUN find ${HUGO_DIR} -name "hugo*.tar.gz" -exec tar xzvf {} -C ${HUGO_DIR} \; -exec rm -v {} \; \
    && ln -s ${HUGO_DIR}/hugo ${HUGO_BIN_DIR}

VOLUME /src
WORKDIR /src

EXPOSE 1313
ENTRYPOINT ["hugo"]
