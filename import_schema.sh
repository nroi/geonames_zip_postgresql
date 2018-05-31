#!/bin/bash

# Usage: HOST='database.myhost.com' DBNAME='mydatabase' USERNAME='myuser' ./import_schema

GEONAMES_URL='http://download.geonames.org/export/zip/allCountries.zip'

if [ ! -f 'allCountries.zip' ]; then
    wget "$GEONAMES_URL" || exit 1
fi

psql --host="$HOST" --dbname="$DBNAME" --username="$USERNAME" --file='create_table.sql' || exit 1
echo 'Copy data from text file to database.'
psql --host="$HOST" --dbname="$DBNAME" --username="$USERNAME" --file='copy_table.sql' || exit 1
