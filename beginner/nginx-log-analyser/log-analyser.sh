#!/bin/bash

FILENAME="nginx-access.log"

if [ ! -f "$FILENAME" ]; then
    echo "Erreur : le fichier '$FILENAME' n'existe pas."
    exit 1
fi

# ── Top 5 IP Addresses ───────────────────────────────────────
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$FILENAME" \
    | sort | uniq -c | sort -rn \
    | head -n 5 \
    | awk '{printf "  %-18s %s requests\n", $2, $1}'

echo

# ── Top 5 Requested Paths ────────────────────────────────────
echo "Top 5 most requested paths:"
awk '{print $7}' "$FILENAME" \
    | sort | uniq -c | sort -rn \
    | head -n 5 \
    | awk '{printf "  %-40s %s requests\n", $2, $1}'

echo

# ── Top 5 Status Codes ───────────────────────────────────────
echo "Top 5 response status codes:"
awk '{print $9}' "$FILENAME" \
    | grep -E '^[1-5][0-9]{2}$' \
    | sort | uniq -c | sort -rn \
    | head -n 5 \
    | awk '{printf "  %s - %s requests\n", $2, $1}'

echo

# ── Top 5 User Agents ────────────────────────────────────────
echo "Top 5 user agents:"
awk -F'"' '{print $6}' "$FILENAME" \
    | sort | uniq -c | sort -rn \
    | head -n 5 \
    | awk '{count=$1; $1=""; printf "  %-70s %s requests\n", substr($0,2), count}'