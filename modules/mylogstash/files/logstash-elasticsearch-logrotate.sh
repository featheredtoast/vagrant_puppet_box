#!/bin/bash
logdate=$(date --date='TZ="UTC" 09:00 2 months ago' +"%Y.%m.%d")
curl -XDELETE "http://localhost:9200/logstash-${logdate}"
