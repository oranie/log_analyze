#!/bin/bash
DIR="/data/work/2011/sql"
FILE="2011_06_"

#./log2db.pl /data/work/2011/cymonext/all_cymonext_acccess_2011-06.log.gz > $DIR/${FILE}cymonext.sql
#./log2db.pl /data/work/2011/dtcymo/all_dtcymo_acccess_2011-06.log.gz > $DIR/${FILE}dtcymo.sql
#./log2db.pl /data/work/2011/ht/all_ht_acccess_2011-06.log.gz > $DIR/${FILE}ht.sql
#./log2db.pl /data/work/2011/ipncymo/all_ipncymo_acccess_2011-06.log.gz > $DIR/${FILE}ipncymo.sql
#./log2db.pl /data/work/2011/mbcymo/all_mbcymo_acccess_2011-06.log.gz > $DIR/${FILE}mbcymo.sql
#./log2db.pl /data/work/2011/andcymo/all_andcymo_acccess_2011-06.log.gz > $DIR/${FILE}andcymo.sql

#./commit.pl /data/work/2011/sql/2011_05_cymonext.sql
./commit.pl /data/work/2011/sql/2011_06_dtcymo.sql
./commit.pl /data/work/2011/sql/2011_06_ht.sql
./commit.pl /data/work/2011/sql/2011_06_ipncymo.sql
./commit.pl /data/work/2011/sql/2011_06_mbcymo.sql
./commit.pl /data/work/2011/sql/2011_06_andcymo.sql
#./make_summary.pl
