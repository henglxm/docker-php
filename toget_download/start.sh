#!/bin/sh
 crond & cd /usr/src/app & /usr/local/bin/uvicorn app:app --reload
