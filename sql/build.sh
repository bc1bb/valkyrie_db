#!/usr/bin/env bash
# Build the EVE: Valkyrie - Warzone SQLite database from the SQL source.
# Works with the sqlite3 CLI if present, otherwise falls back to Python's
# built-in sqlite3 module (no extra dependencies).
set -euo pipefail
cd "$(dirname "$0")"

SQL="eve_valkyrie_warzone.sql"
DB="eve_valkyrie_warzone.db"
rm -f "$DB"

if command -v sqlite3 >/dev/null 2>&1; then
    echo "Using sqlite3 CLI..."
    sqlite3 "$DB" < "$SQL"
else
    echo "sqlite3 CLI not found; using python3 sqlite3 module..."
    python3 - "$SQL" "$DB" <<'PY'
import sqlite3, sys
sql_path, db_path = sys.argv[1], sys.argv[2]
con = sqlite3.connect(db_path)
con.executescript(open(sql_path).read())
con.close()
PY
fi

echo "Built $DB"
