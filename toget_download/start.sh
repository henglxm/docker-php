#!/bin/sh
 crond & cd /usr/src/app & /usr/local/bin/uvicorn --host 0.0.0.0 --port 5000 app:app --reload
