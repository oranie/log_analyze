ALTER TABLE LOG_ANALYZE_RESOURCE CHANGE COLUMN `avg_response_time` `avg_response_time` float(11,2) DEFAULT 0;
ALTER TABLE LOG_ANALYZE_RESOURCE CHANGE COLUMN `std` `std` float(11,2) DEFAULT 0;
ALTER TABLE LOG_ANALYZE_RESOURCE CHANGE COLUMN `variance` `variance` float(11,2) DEFAULT 0;
ALTER TABLE LOG_ANALYZE_RESOURCE CHANGE COLUMN `stddev_samp` `stddev_samp` float(11,2) DEFAULT 0;
ALTER TABLE LOG_ANALYZE_RESOURCE CHANGE COLUMN `var_samp` `var_samp` float(11,2) DEFAULT 0;