# Moniteur de Sites Web

Un script Bash simple pour surveiller la disponibilité de plusieurs sites web en vérifiant leur code de réponse HTTP.

## Fonctionnalités

- Surveillance continue de plusieurs sites web
- Vérification du code de réponse HTTP (200 = OK)
- Journalisation des alertes dans un fichier log
- Intervalle configurable entre les vérifications
- Affichage en temps réel du statut des sites

## Prérequis

- Bash
- curl (doit être installé sur le système)

## Installation

1. Clonez ou téléchargez le script `monitor.sh`
2. Rendez le script exécutable :
   ```bash
   chmod +x monitor.sh
   ```

## Configuration

Modifiez les variables en haut du script selon vos besoins :

- `SITES` : Liste des URLs à surveiller
- `LOG_FILE` : Nom du fichier de log pour les alertes
- `INTERVAL` : Intervalle en secondes entre les vérifications (par défaut : 60)

## Utilisation

Lancez le script :
```bash
./monitor.sh
```

Le script s'exécute en boucle infinie et affiche le statut de chaque site :
- `[OK]` : Le site répond avec un code 200
- `[ALERTE]` : Le site ne répond pas correctement (code différent de 200)

Les alertes sont automatiquement enregistrées dans le fichier `monitor.log` avec un timestamp.

## Exemple de sortie

```
[14:30:15] [OK]     https://google.com
[14:30:15] [OK]     https://github.com
[14:30:15] [ALERTE] https://monsite.com (code 404)
[14:30:15] [OK]     https://youtube.com
[14:30:15] [OK]     https://facebook.com
```

## Arrêt du script

Pour arrêter la surveillance, utilisez `Ctrl+C`.

## Personnalisation

Vous pouvez ajouter ou modifier les sites dans le tableau `SITES`. Assurez-vous que les URLs sont valides et accessibles.