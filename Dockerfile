FROM node:8-alpine
MAINTAINER pablo@ppamo.cl

ENV HOST 0.0.0.0
ENV PORT 9090
ENV SKIP_LOGIN true
ENV ACCEPT_LICENSE N
ENV DISABLE_ANALYTICS Y
EXPOSE 9090
WORKDIR /apis

COPY run.sh tests.sh /
RUN apk update && apk upgrade && \
	apk add curl tini alpine-sdk python && \
	chmod +x /run.sh /tests.sh
RUN npm config -g set strict-ssl false && \
	npm config set user root && \
	npm install -g apiconnect@1.0.3

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/run.sh"]
