#!/bin/bash

# Script to dump all databases from a MySQL server

if [ "$2" -eq "" ]; then
	echo "Usage: $0 <mysql_root_user> <mysql_root_pass>"
	exit
fi


MYSQL_USER=$1
MYSQL_PASS=$2
MYSQL_CONN="-u${MYSQL_USER} -p${MYSQL_PASS}"

# Collect all database names except for
# mysql, information_schema, and performance_schema
SQL="SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN"
SQL="${SQL} ('mysql','information_schema','performance_schema')"

DBLISTFILE=/tmp/DatabasesToDump.txt
mysql ${MYSQL_CONN} -ANe"${SQL}" > ${DBLISTFILE}

DBLIST=""
for DB in `cat ${DBLISTFILE}` ; do DBLIST="${DBLIST} ${DB}" ; done

# Do the dump
MYSQLDUMP_OPTIONS="--routines --triggers --single-transaction"
mysqldump ${MYSQL_CONN} ${MYSQLDUMP_OPTIONS} --databases ${DBLIST} > all-dbs.sql

