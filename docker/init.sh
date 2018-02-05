#!/bin/bash
sed -i 's/create index yarn_app_result_i4 on yarn_app_result (flow_exec_id);/create index yarn_app_result_i4 on yarn_app_result (flow_exec_id(100));/g' /opt/dr-elephant-2.0.13/conf/evolutions/default/1.sql
sed -i 's/create index yarn_app_result_i5 on yarn_app_result (job_def_id);/create index yarn_app_result_i5 on yarn_app_result (job_def_id(100));/g' /opt/dr-elephant-2.0.13/conf/evolutions/default/1.sql
sed -i 's/create index yarn_app_result_i6 on yarn_app_result (flow_def_id);/create index yarn_app_result_i6 on yarn_app_result (flow_def_id(100));/g' /opt/dr-elephant-2.0.13/conf/evolutions/default/1.sql
sed -i 's/db_password=""/db_password="root"/g' /opt/dr-elephant-2.0.13/app-conf/elephant.conf
sed -i 's/db_url="localhost"/db_url="localhost:3306"/g' /opt/dr-elephant-2.0.13/app-conf/elephant.conf
mysqld_safe --datadir='/var/lib/mysql' &
sleep 10
mysqladmin -u root password "root"
mysql -Bse "create database drelephant;"
cd /opt/dr-elephant-2.0.13
bin/start.sh app-conf/
