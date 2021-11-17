#!/bin/bash

db="marvel.sqlite"
rm -f ${db}
touch ${db}

sqlite3 ${db} < create-db.sql
