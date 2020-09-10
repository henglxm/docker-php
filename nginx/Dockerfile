FROM nginx:1.19-alpine

LABEL maintainer="hengoye@sina.cn"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache --virtual .build-deps logrotate 

ENTRYPOINT []
CMD crond start && nginx -g 'daemon off;'
