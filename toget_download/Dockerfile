FROM python:alpine3.12

LABEL maintainer="hengoye@sina.cn"

WORKDIR /usr/src/app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    musl-dev \
    ffmpeg


COPY requirements.txt ./
COPY root /var/spool/cron/crontabs/root
COPY start.sh /start.sh
RUN pip install --proxy="http://192.168.5.171:1080" --upgrade pip
RUN pip install --proxy="http://192.168.5.171:1080" --no-cache-dir -r requirements.txt
COPY YoutubeDL.py /usr/local/lib/python3.9/site-packages/youtube_dl/

CMD [ "sh", "/start.sh" ]
