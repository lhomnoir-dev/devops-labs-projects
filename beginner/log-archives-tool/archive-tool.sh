#!/bin/bash

# ── Vérification des arguments ───────────────────────────────
if [ -z "$1" ]; then
    echo "Usage: $0 <dossier_source>"
    exit 1
fi

# ── Configuration ────────────────────────────────────────────
SOURCE_DIR=$1
BACKUP_DIR="backups"
RETENTION_DAYS=7
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# ── Vérifications ────────────────────────────────────────────
if [ ! -d "$SOURCE_DIR" ]; then
    echo "[ERREUR] Le dossier '$SOURCE_DIR' n'existe pas"
    exit 1
fi

[ ! -d "$BACKUP_DIR" ] && mkdir -p "$BACKUP_DIR"

# ── Sauvegarde ───────────────────────────────────────────────
if tar -czf "$BACKUP_FILE" "$SOURCE_DIR"; then
    echo "[OK] Sauvegarde réussie !"
else
    echo "[ECHEC] Sauvegarde échouée !"
    exit 1
fi

# ── Nettoyage ────────────────────────────────────────────────
find "$BACKUP_DIR" -name "*.tar.gz" -mtime +$RETENTION_DAYS -delete

# ── Résumé ───────────────────────────────────────────────────
echo "Sauvegarde créée  -> $BACKUP_FILE"
du -sh "$BACKUP_FILE"
COUNT=$(find "$BACKUP_DIR" -name "*.tar.gz" | wc -l)
echo "Sauvegardes conservées : $COUNT"