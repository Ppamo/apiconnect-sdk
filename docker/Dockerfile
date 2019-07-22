FROM node:8-alpine
MAINTAINER pablo@ppamo.cl

ENV HOST 0.0.0.0
ENV PORT 9090
ENV SKIP_LOGIN true
EXPOSE 9090
WORKDIR /apis

RUN apk update && apk upgrade && \
	apk add curl alpine-sdk python
RUN npm config -g set strict-ssl false && \
	npm config set user root && \
	npm install -g apiconnect@4.0.29

CMD ["apic", "edit", "--accept-license"]
