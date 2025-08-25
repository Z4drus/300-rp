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
- [4. Mise en place de SSH (NAT VMware + IP fixe)](#4-mise-en-place-de-ssh-nat-vmware--ip-fixe)
  - [4.1 Contexte réseau (NAT 192.168.254.0/24)](#41-contexte-réseau-nat-192168254024)
  - [4.2 Configurer Netplan (IP statique)](#42-configurer-netplan-ip-statique)
  - [4.3 Appliquer la configuration](#43-appliquer-la-configuration)
  - [4.4 Installer et activer SSH](#44-installer-et-activer-ssh)
  - [4.5 Connexion depuis Windows](#45-connexion-depuis-windows)
  - [4.6 Transfert de fichiers avec SCP](#46-transfert-de-fichiers-avec-scp)
- [5. Références](#5-références)

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

## 4. Mise en place de SSH (NAT VMware + IP fixe)

### 4.1 Contexte réseau (NAT 192.168.254.0/24)
Votre VM est sur un réseau virtuel en NAT (VMware) avec la plage `192.168.254.0/24`. On configure une IP statique dans ce sous-réseau (ex.: `192.168.254.10`) pour joindre la VM depuis l'hôte.

### 4.2 Configurer Netplan (IP statique)
Éditer la configuration Netplan (adaptez l'interface si nécessaire, ex.: `ens33`).

```bash
sudo nano /etc/netplan/50-cloud-init.yaml
```

Mettre le contenu suivant (adaptez l'utilisateur si nécessaire) :

```yaml
network:
  version: 2
  ethernets:
    ens33:
      dhcp4: no
      addresses:
        - 192.168.254.10/24
      gateway4: 192.168.254.2
      nameservers:
        addresses:
          - 8.8.8.8
          - 1.1.1.1
```

### 4.3 Appliquer la configuration
```bash
sudo netplan apply
```

Vérifications rapides :

```bash
ip a
ping 192.168.254.2 -c 4
ping 8.8.8.8 -c 4
ping google.com -c 4
```

### 4.4 Installer et activer SSH
```bash
sudo apt update
sudo apt install openssh-server -y
sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl status ssh
```

### 4.5 Connexion depuis Windows
Dans PowerShell, cmd, Git Bash ou Windows Terminal :

```bash
ssh noe@192.168.254.10
```

Remplacez `noe` par votre utilisateur Linux.

### 4.6 Transfert de fichiers avec SCP
Sur la machine hôte (Windows), créer un fichier `test.txt` puis envoyer vers la VM :

```bash
scp test.txt noe@192.168.254.10:/home/noe/
```

Côté VM, vérifier :

```bash
ls -l /home/noe/
cat /home/noe/test.txt
```

## 5. Références
- Documentation Ubuntu: https://help.ubuntu.com
- Debian Handbook: https://debian-handbook.info
- Arch Wiki (référence générale): https://wiki.archlinux.org


