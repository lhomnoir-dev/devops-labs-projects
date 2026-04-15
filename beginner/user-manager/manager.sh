#!/bin/bash

# ── Vérifications ────────────────────────────────────────────

# 1. Vérifier que le script est exécuté en tant que root
if [ "$EUID" -ne 0 ]; then
    echo "Ce script doit être exécuté en tant que root."
    exit 1
fi


# ── Fonctions ────────────────────────────────────────────────

list_users() {
    awk -F':' '$3>=1000 {printf "  %-15s UID:%-6s Shell:%s\n", $1, $3, $7}' /etc/passwd
}

create_user() {
    local username
    local password

    read -p "Nom d'utilisateur : " username
    read -sp "Mot de passe : " password
    echo

    if [ -z "$username" ]; then
        echo "[ERREUR] Le nom d'utilisateur ne peut pas être vide."
        return 1
    fi

    if id "$username" &>/dev/null; then
        echo "[ERREUR] L'utilisateur '$username' existe déjà."
        return 1
    fi

    useradd -m "$username"
    echo "$password" | passwd --stdin "$username"
    echo "[OK] Utilisateur '$username' créé."
}

# 4. Fonction supprimer_utilisateur
del_user() {
    local username
    local response

    read -p "Nom d'utilisateur : " username
    echo

    if [ -z "$username" ]; then
        echo "[ERREUR] Le nom d'utilisateur ne peut pas être vide."
        return 1
    fi

    if ! id "$username" &>/dev/null; then
        echo "[ERREUR] L'utilisateur '$username' n'existe pas."
        return 1
    fi

    read -p "Voulez-vous vraiment supprimer '$username' ? (y/n): " response
    if [ "$response" = "y" ]; then
        userdel -r "$username"
        echo "[OK] Utilisateur '$username' supprimé."
    else
        echo "Suppression annulée."
    fi
}


# ── Menu principal ────────────────────────────────────────────
echo "=== Gestionnaire d'utilisateurs ==="
select choix in "Lister" "Créer" "Supprimer" "Quitter"; do
    case $choix in
        "Lister")  list_users  ;;
        "Créer")   create_user   ;;
        "Supprimer") del_user  ;;
        "Quitter")  break ;;
        *)           echo "Option invalide" ;;
    esac
done