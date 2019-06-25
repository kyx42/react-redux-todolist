#!/bin/bash
set -e

createuser -U postgres -d -e -E -l -P -r -s todolist

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	GRANT ALL PRIVILEGES ON DATABASE todolist TO todolist;
EOSQL
