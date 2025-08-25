# Rapport personnel — Module 300

**Auteur**: Noé Romanens  
**Version**: v1

## Table des matières
- [1. Présentation générale](#1-présentation-générale)
- [2. Linux: définition et distributions](#2-linux-définition-et-distributions)
  - [2.1 Qu'est-ce que Linux ?](#21-quest-ce-que-linux-)
  - [2.2 Noyau vs distribution](#22-noyau-vs-distribution)
  - [2.3 Principales distributions](#23-principales-distributions)
  - [2.4 Environnements de bureau](#24-environnements-de-bureau)
  - [2.5 Cas d'usage courants](#25-cas-dusage-courants)
- [3. Commandes de base sur Ubuntu Linux](#3-commandes-de-base-sur-ubuntu-linux)
  - [3.1 Navigation dans le système de fichiers](#31-navigation-dans-le-système-de-fichiers)
  - [3.2 Gestion des fichiers et dossiers](#32-gestion-des-fichiers-et-dossiers)
  - [3.3 Lecture et édition de fichiers](#33-lecture-et-édition-de-fichiers)
  - [3.4 Permissions et propriétaires](#34-permissions-et-propriétaires)
  - [3.5 Gestion des paquets (APT)](#35-gestion-des-paquets-apt)
  - [3.6 Réseau de base](#36-réseau-de-base)
  - [3.7 Processus et ressources](#37-processus-et-ressources)
  - [3.8 Disques et espace](#38-disques-et-espace)
  - [3.9 Journaux système](#39-journaux-système)
- [4. Références](#4-références)

## 1. Présentation générale
Brève introduction au contenu du rapport et aux objectifs du module 300.

## 2. Linux: définition et distributions

### 2.1 Qu'est-ce que Linux ?
Linux est un système d'exploitation libre basé sur le noyau Linux. Il est utilisé sur des serveurs, des postes de travail, des appareils mobiles (Android) et des systèmes embarqués.

### 2.2 Noyau vs distribution
- Noyau (kernel): cœur du système gérant matériel, mémoire, processus.
- Distribution (distro): ensemble « noyau + outils + gestionnaire de paquets + environnement de bureau » (ex.: Ubuntu, Fedora).

### 2.3 Principales distributions
- Debian / Ubuntu (et dérivés: Linux Mint, Pop!_OS)
- Fedora (en amont de Red Hat)
- RHEL / Rocky / AlmaLinux (orientées entreprise)
- Arch Linux / Manjaro (rolling release)
- openSUSE (Leap, Tumbleweed)

### 2.4 Environnements de bureau
GNOME, KDE Plasma, XFCE, Cinnamon… Chaque environnement propose une expérience utilisateur et des outils différents.

### 2.5 Cas d'usage courants
Serveurs web, conteneurs, développement logiciel, bureautique, éducation, sécurité et réseau.

## 3. Commandes de base sur Ubuntu Linux

### 3.1 Navigation dans le système de fichiers
```bash
pwd            # afficher le répertoire courant
ls -la         # lister fichiers (détails, y compris fichiers cachés)
cd /etc        # changer de répertoire
cd ~           # aller vers le home de l'utilisateur
```

### 3.2 Gestion des fichiers et dossiers
```bash
touch fichier.txt          # créer un fichier vide
mkdir projets              # créer un dossier
cp fichier.txt copie.txt   # copier un fichier
mv copie.txt dossier/      # déplacer/renommer
rm fichier.txt             # supprimer un fichier
rm -r dossier              # supprimer un dossier et son contenu
```

### 3.3 Lecture et édition de fichiers
```bash
cat /etc/os-release     # afficher le contenu d'un fichier
head -n 10 fichier.log  # premières lignes
tail -n 20 fichier.log  # dernières lignes
less fichier.log        # lecture paginée (q pour quitter)
nano fichier.txt        # éditeur en terminal
```

### 3.4 Permissions et propriétaires
```bash
ls -l                    # voir les permissions
chmod u+x script.sh      # ajouter l'exécution pour l'utilisateur
chmod 644 fichier.txt    # rw-r--r--
sudo chown user:group fichier.txt  # changer propriétaire:groupe
```

### 3.5 Gestion des paquets (APT)
```bash
sudo apt update                     # mettre à jour l'index des paquets
sudo apt upgrade -y                 # mettre à jour les paquets installés
apt search nginx                    # rechercher un paquet
sudo apt install nginx -y           # installer un paquet
sudo apt remove nginx -y            # désinstaller un paquet
```

### 3.6 Réseau de base
```bash
ip a                 # adresses IP
ping -c 4 1.1.1.1    # tester la connectivité
curl -I https://ubuntu.com  # en-têtes HTTP
```

### 3.7 Processus et ressources
```bash
ps aux | less    # lister les processus
top              # surveiller CPU/mémoire (htop si installé)
kill 1234        # terminer le processus PID 1234
```

### 3.8 Disques et espace
```bash
df -h                # espace disque par système de fichiers
du -sh *             # taille des éléments dans le dossier courant
lsblk                # périphériques de blocs (disques/partitions)
```

### 3.9 Journaux système
```bash
journalctl -xe | less          # journaux système (systemd)
sudo tail -f /var/log/syslog   # suivre en direct syslog
```

## 4. Références
- Documentation Ubuntu: https://help.ubuntu.com
- Debian Handbook: https://debian-handbook.info
- Arch Wiki (référence générale): https://wiki.archlinux.org


