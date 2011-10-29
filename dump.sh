#!/bin/bash

mysqldump -uroot -pyura0244 -h  ip-10-148-126-202.ap-northeast-1.compute.internal --default-character-set=utf8 --hex-blob slow_log log_table_history LOG_ANALYZE_RESOURCE LOG_ANALYZE_TOTAL_EVERY_TIME > dump.sql
#mysqldump -uroot -pyura0244  --default-character-set=utf8 --hex-blob slow_log log_table_history LOG_ANALYZE_RESOURCE LOG_ANALYZE_TOTAL_EVERY_TIME > dump.sql
