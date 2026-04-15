# Gestionnaire d'Utilisateurs

Un script Bash interactif pour gérer les utilisateurs système sur Linux. Permet de lister, créer et supprimer des utilisateurs de manière sécurisée.

## Fonctionnalités

- **Lister les utilisateurs** : Affiche tous les utilisateurs avec UID ≥ 1000 (utilisateurs normaux)
- **Créer un utilisateur** : Ajoute un nouvel utilisateur avec mot de passe
- **Supprimer un utilisateur** : Supprime un utilisateur existant avec confirmation
- **Interface menu** : Navigation simple via un menu interactif
- **Vérifications de sécurité** : Validation des entrées et confirmations pour les actions destructives

## Prérequis

- Système Linux
- Droits root (sudo ou exécution en tant que root)
- Bash
- Commandes système : `useradd`, `userdel`, `passwd`, `id`, `awk`

## Installation

1. Téléchargez le script `manager.sh`
2. Rendez le script exécutable :
   ```bash
   chmod +x manager.sh
   ```

## Utilisation

### Lancement du script

Le script doit être exécuté avec les droits root :

```bash
sudo ./manager.sh
```

Ou directement en tant que root :
```bash
su -c './manager.sh'
```

### Menu principal

Après lancement, un menu interactif s'affiche :

1. **Lister** : Affiche la liste des utilisateurs système
2. **Créer** : Crée un nouvel utilisateur
3. **Supprimer** : Supprime un utilisateur existant
4. **Quitter** : Termine le script

### Opérations détaillées

#### Lister les utilisateurs
Affiche le nom d'utilisateur, l'UID et le shell par défaut pour chaque utilisateur système (UID ≥ 1000).

#### Créer un utilisateur
- Demande le nom d'utilisateur
- Demande le mot de passe (saisi de manière sécurisée, sans affichage)
- Vérifie que le nom n'est pas vide et que l'utilisateur n'existe pas déjà
- Crée l'utilisateur avec un répertoire home (`-m`)
- Définit le mot de passe

#### Supprimer un utilisateur
- Demande le nom d'utilisateur
- Vérifie que l'utilisateur existe
- Demande confirmation avant suppression
- Supprime l'utilisateur et son répertoire home (`-r`)

## Sécurité

- **Droits root requis** : Le script vérifie automatiquement les droits d'exécution
- **Validation des entrées** : Vérification des noms d'utilisateurs vides ou invalides
- **Confirmation de suppression** : Demande explicite avant de supprimer un utilisateur
- **Gestion des erreurs** : Messages d'erreur clairs pour les cas d'échec

## Exemples d'utilisation

```
=== Gestionnaire d'utilisateurs ===
1) Lister
2) Créer
3) Supprimer
4) Quitter
#? 1
  user1           UID:1000  Shell:/bin/bash
  user2           UID:1001  Shell:/bin/bash

#? 2
Nom d'utilisateur : nouveau_user
Mot de passe :
[OK] Utilisateur 'nouveau_user' créé.

#? 3
Nom d'utilisateur : ancien_user
Voulez-vous vraiment supprimer 'ancien_user' ? (y/n): y
[OK] Utilisateur 'ancien_user' supprimé.
```

## Notes importantes

- Ce script est destiné à un usage éducatif et de base
- Pour un environnement de production, considérez des outils plus avancés comme `usermod` ou des interfaces graphiques
- Les mots de passe sont saisis en mode silencieux pour la sécurité
- La suppression d'un utilisateur avec `-r` supprime également son répertoire home et ses fichiers

## Dépannage

- **Erreur "Ce script doit être exécuté en tant que root"** : Utilisez `sudo` ou exécutez en tant que root
- **Erreur "L'utilisateur existe déjà"** : Choisissez un nom d'utilisateur différent
- **Erreur "L'utilisateur n'existe pas"** : Vérifiez l'orthographe du nom d'utilisateur