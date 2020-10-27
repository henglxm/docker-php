FROM python:alpine3.12

LABEL maintainer="hengoye@sina.cn"

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY root /var/spool/cron/crontabs/root
COPY start.sh /start.sh
RUN pip install --proxy="http://192.168.5.170:1080" --upgrade pip
RUN pip install --proxy="http://192.168.5.170:1080" --no-cache-dir -r requirements.txt

CMD [ "sh", "/start.sh" ]
