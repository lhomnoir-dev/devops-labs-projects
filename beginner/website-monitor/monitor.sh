#!/bin/bash

# ── Configuration ────────────────────────────────────────────
SITES=("https://google.com" "https://github.com" "https://monsite.com"
       "https://youtube.com" "https://facebook.com")
LOG_FILE="monitor.log"
INTERVAL=60

# ── Vérifications ────────────────────────────────────────────
command -v curl >/dev/null 2>&1 || { echo >&2 "curl est requis mais n'est pas installé."; exit 1; }

# ── Fonctions ────────────────────────────────────────────────
check_site() {
    local URL=$1
    curl --silent --output /dev/null --max-time 10 -w "%{http_code}" "$URL"
}

log_result() {
    local URL=$1
    local CODE=$2
    local TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$TIMESTAMP] $URL - $CODE ALERTE" >> "$LOG_FILE"
}

# ── Boucle principale ─────────────────────────────────────────
while true; do
    for site in "${SITES[@]}"; do
        code=$(check_site "$site")
        TIMESTAMP=$(date +"%H:%M:%S")
        if [ "$code" -eq 200 ]; then
            echo "[$TIMESTAMP] [OK]     $site"
        else
            echo "[$TIMESTAMP] [ALERTE] $site (code $code)"
            log_result "$site" "$code"
        fi
    done
    sleep "$INTERVAL"
done