#!/bin/bash

set -euo pipefail

usage() {
    cat <<EOF
Usage: $0 [--backup | --restore <sql-file>]

Options:
  -b, --backup             Drop and recreate the public schema inside the target container.
  -r, --restore <sql-file> Stream the provided SQL file into psql inside the target container.
  -h, --help               Show this help message.

Environment overrides:
  DB_CONTAINER_ID          Docker container name/ID (default: postgresdb)
  DB_USER                  Database user for psql (default: corteza)
EOF
}

container_id=${DB_CONTAINER_ID:-postgresdb}
db_user=${DB_USER:-corteza}
action=""
sql_file=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -d|--cleanall|--delete)
            [[ -n "$action" ]] && { echo "Only one action can be specified." >&2; exit 1; }
            action="cleanall"
            shift
            ;;
        -r|--restore)
            [[ -n "$action" ]] && { echo "Only one action can be specified." >&2; exit 1; }
            action="restore"
            [[ $# -ge 2 ]] || { echo "Restore requires a SQL file." >&2; usage; exit 1; }
            sql_file="$2"
            shift 2
            ;;
        -b|--backup)
            [[ -n "$action" ]] && { echo "Only one action can be specified." >&2; exit 1; }
            action="backup"
            [[ $# -ge 2 ]] || { echo "Please specify the backup filename" >&2; usage; exit 1; }
            sql_file="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1" >&2
            usage
            exit 1
            ;;
    esac
done

[[ -n "$action" ]] || { usage >&2; exit 1; }

case "$action" in
    cleanall)
        docker exec -i "$container_id" \
            psql -X -U "$db_user" -v ON_ERROR_STOP=1 \
            -c "DROP SCHEMA IF EXISTS public CASCADE; CREATE SCHEMA public;"
        ;;
    restore)
        [[ -f "$sql_file" ]] || { echo "SQL file not found: $sql_file" >&2; exit 1; }
        {
            printf '%s\n' '\unrestrict' \
            cat "$sql_file"
        } | docker exec -i "$container_id" \
            psql -X -U "$db_user" -v ON_ERROR_STOP=1
        ;;
    backup)
        docker exec -i $container_id pg_dump -U $db_user corteza > $sql_file
        ;;
esac