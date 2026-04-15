#!/bin/bash

# ── Vérifications ────────────────────────────────────────────

# 1. Vérifier que le script est exécuté en tant que root
#    indice: $EUID contient l'ID de l'utilisateur courant (0 = root)


# ── Fonctions ────────────────────────────────────────────────

# 2. Fonction lister_utilisateurs
#    afficher tous les utilisateurs avec un UID >= 1000 (utilisateurs réels)
#    indice: /etc/passwd contient tous les utilisateurs
#    format voulu : nom - UID - shell
list_user() {
    # ...
}

# 3. Fonction creer_utilisateur
#    demander le nom, créer l'utilisateur, définir son mot de passe
#    indice: useradd, passwd
#    vérifier que l'utilisateur n'existe pas déjà avant de le créer
#    indice: id <nom> retourne 0 si l'utilisateur existe
create_user() {
    # ...
}

# 4. Fonction supprimer_utilisateur
#    demander le nom, confirmer la suppression, supprimer l'utilisateur
#    indice: userdel -r (supprime aussi le dossier home)
#    vérifier que l'utilisateur existe avant de le supprimer
del_user() {
    # ...
}


# ── Menu principal ────────────────────────────────────────────

# 5. Afficher un menu avec select et appeler la bonne fonction
#    options : Lister, Créer, Supprimer, Quitter
#    indice: select choix in "option1" "option2" ...

echo "=== Gestionnaire d'utilisateurs ==="
# ...