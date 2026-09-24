#!/bin/bash

LISTNAME="$1"
CSV="$2"

if [ -z "$LISTNAME" ] || [ -z "$CSV" ]; then
    echo "Usage: $0 LISTNAME emails.csv"
    exit 1
fi

while IFS=, read -r email rest; do
    email=$(echo "$email" | tr -d '\r' | xargs | tr '[:upper:]' '[:lower:]')

    [ -z "$email" ] && continue

    kerberos="${email%@mit.edu}"

    if [ "$kerberos" = "$email" ] && [[ "$email" == *@* ]]; then
        echo "Skipping non-MIT email: $email"
        continue
    fi

    echo "Working on $kerberos to $LISTNAME..."

    if blanche "$LISTNAME" -a "$kerberos"; then
        echo "Added $kerberos"
    else
        echo "FAILED: $kerberos"
    fi
done < "$CSV"
