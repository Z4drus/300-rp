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
    - [3.4.1 Utilisateurs et groupes](#341-utilisateurs-et-groupes)
    - [3.4.2 Gérer les utilisateurs](#342-gérer-les-utilisateurs)
    - [3.4.3 Gérer les groupes](#343-gérer-les-groupes)
    - [3.4.4 Modèle de permissions (rwx, U/G/O)](#344-modèle-de-permissions-rwx-ugo)
    - [3.4.5 chmod: symbolique, octal et binaire](#345-chmod-symbolique-octal-et-binaire)
    - [3.4.6 Bits spéciaux: SUID, SGID, Sticky](#346-bits-spéciaux-suid-sgid-sticky)
    - [3.4.7 Propriété: chown et chgrp](#347-propriété-chown-et-chgrp)
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
- [5. Gestion des applications, mises à jour et services](#5-gestion-des-applications-mises-à-jour-et-services)
  - [5.1 Gestionnaire bas niveau: dpkg](#51-gestionnaire-bas-niveau-dpkg)
  - [5.2 Gestionnaire haut niveau: APT](#52-gestionnaire-haut-niveau-apt)
  - [5.3 Paquets universels: Snap](#53-paquets-universels-snap)
  - [5.4 Mises à jour (manuelles et automatisées)](#54-mises-à-jour-manuelles-et-automatisées)
  - [5.5 Mises à jour de sécurité: unattended-upgrades](#55-mises-à-jour-de-sécurité-unattended-upgrades)
  - [5.6 Services avec systemd](#56-services-avec-systemd)
  - [5.7 Planification de tâches avec cron](#57-planification-de-tâches-avec-cron)
- [6. Disques, partitions et montage](#6-disques-partitions-et-montage)
  - [6.1 Découvrir les disques et partitions](#61-découvrir-les-disques-et-partitions)
  - [6.2 Partitionner un disque](#62-partitionner-un-disque)
  - [6.3 Formater (systèmes de fichiers)](#63-formater-systèmes-de-fichiers)
  - [6.4 Monter et vérifier](#64-monter-et-vérifier)
  - [6.5 Montage automatique avec fstab](#65-montage-automatique-avec-fstab)
  - [6.6 Redimensionner une partition et un FS](#66-redimensionner-une-partition-et-un-fs)
  - [6.7 Partage avec Windows (FAT32/NTFS)](#67-partage-avec-windows-fat32ntfs)
- [7. Partage de fichiers: NFS et Samba](#7-partage-de-fichiers-nfs-et-samba)
  - [7.1 Contexte et objectifs](#71-contexte-et-objectifs)
  - [7.2 NFS côté serveur (Ubuntu Server)](#72-nfs-côté-serveur-ubuntu-server)
  - [7.3 NFS côté client (Ubuntu Desktop)](#73-nfs-côté-client-ubuntu-desktop)
  - [7.4 Samba côté serveur (Ubuntu Server)](#74-samba-côté-serveur-ubuntu-server)
  - [7.5 Client Windows 11 vers Samba](#75-client-windows-11-vers-samba)
  - [7.6 Client Linux vers Samba (optionnel)](#76-client-linux-vers-samba-optionnel)
  - [7.7 Dépannage et cas courants](#77-dépannage-et-cas-courants)
  - [7.8 Bonnes pratiques et différences](#78-bonnes-pratiques-et-différences)
- [8. DHCP: principes et mise en place (Kea)](#8-dhcp-principes-et-mise-en-place-kea)
  - [8.1 Rappels sur DHCP (IPv4)](#81-rappels-sur-dhcp-ipv4)
  - [8.2 Installation du serveur Kea (Ubuntu 24.04)](#82-installation-du-serveur-kea-ubuntu-2404)
  - [8.3 Configuration minimale DHCPv4](#83-configuration-minimale-dhcpv4)
  - [8.4 Démarrer et activer le service](#84-démarrer-et-activer-le-service)
  - [8.5 Tests côté client](#85-tests-côté-client)
  - [8.6 Journaux et baux](#86-journaux-et-baux)
  - [8.7 Réservations par adresse MAC](#87-réservations-par-adresse-mac)
  - [8.8 Bonnes pratiques et dépannage](#88-bonnes-pratiques-et-dépannage)
- [9. DNS: principes et mise en place (BIND 9)](#9-dns-principes-et-mise-en-place-bind-9)
  - [9.1 Concepts DNS](#91-concepts-dns)
  - [9.2 Installation de BIND 9](#92-installation-de-bind-9)
  - [9.3 Configuration des zones (forward et reverse)](#93-configuration-des-zones-forward-et-reverse)
  - [9.4 Options globales et sécurité](#94-options-globales-et-sécurité)
  - [9.5 Vérification, rechargement et tests](#95-vérification-rechargement-et-tests)
  - [9.6 Intégration avec DHCP (options Kea)](#96-intégration-avec-dhcp-options-kea)
  - [9.7 Résolution récursive et forwarders](#97-résolution-récursive-et-forwarders)
  - [9.8 Bonnes pratiques et dépannage](#98-bonnes-pratiques-et-dépannage)
  - [9.9 Enregistrements SOA et gestion du Serial](#99-enregistrements-soa-et-gestion-du-serial)
  - [9.10 DNS et transport (UDP/TCP), transferts de zone](#910-dns-et-transport-udptcp-transferts-de-zone)
  - [9.11 Diagnostics avancés (dig, journalisation, tests)](#911-diagnostics-avancés-dig-journalisation-tests)
- [10. Références](#10-références)

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

#### 3.4.1 Utilisateurs et groupes

```bash
id                       # identités de l'utilisateur courant
# uid=1000(noe) gid=1000(noe) groups=1000(noe),27(sudo),...

id alice                 # info d'un autre utilisateur
getent passwd alice      # ligne /etc/passwd pour alice
getent group dev         # info d'un groupe

groups alice             # groupes (noms) de l'utilisateur
```

Un utilisateur appartient à un groupe principal et peut être membre de groupes secondaires. Les permissions Unix se basent sur trois classes: utilisateur (U), groupe (G) et autres (O).

#### 3.4.2 Gérer les utilisateurs

```bash
sudo useradd -m -s /bin/bash alice   # créer alice (home + shell)
sudo passwd alice                    # définir le mot de passe

sudo usermod -aG sudo alice          # ajouter alice au groupe sudo
sudo usermod -s /usr/bin/zsh alice   # changer de shell
sudo usermod -L alice                # verrouiller le compte
sudo usermod -U alice                # déverrouiller

sudo deluser alice                   # supprimer l'utilisateur (garde /home)
sudo deluser --remove-home alice     # supprime aussi son /home
```

#### 3.4.3 Gérer les groupes

```bash
sudo groupadd dev                    # créer un groupe
sudo usermod -aG dev alice           # ajouter alice au groupe dev
sudo gpasswd -d alice dev            # retirer alice du groupe dev
sudo groupdel dev                    # supprimer le groupe (s'il est vide)
```

Astuce projet collaboratif: créer un groupe, l'assigner à un dossier commun et gérer les permissions de groupe (voir SGID plus bas).

#### 3.4.4 Modèle de permissions (rwx, U/G/O)

Chaque entrée `ls -l` montre: type + 9 bits `rwxrwxrwx` (U/G/O).

```bash
ls -l fichier.txt
# -rw-r----- 1 noe dev 1K date fichier.txt
# U: rw- (lecture/écriture) | G: r-- (lecture) | O: ---
```

Correspondance binaire et octale par triplet (r=4, w=2, x=1):
- rwx = 111b = 7
- rw- = 110b = 6
- r-x = 101b = 5
- r-- = 100b = 4

#### 3.4.5 chmod: symbolique, octal et binaire

- Symbolique: `u/g/o` + `+`/`-`/`=` + `rwx`.
- Octal: trois chiffres U/G/O, somme des bits (4+2+1).
- Binaire: non supporté directement par `chmod`, mais équivaut aux octaux via conversion 3 bits → 1 chiffre.

```bash
# Symbolique
chmod g+w fichier.txt             # ajoute l'écriture au groupe
chmod o-r fichier.txt             # retire la lecture aux autres

# Octal
chmod 640 fichier.txt             # U:rw- (6) G:r-- (4) O:--- (0)
ls -l fichier.txt | cut -d' ' -f1
# -rw-r-----

# «En binaire» (conceptuel): 110 100 000 → 6 4 0
chmod 640 fichier.txt             # même résultat

# Dossier + inheritance pratique
chmod -R 2755 /srv/projets        # voir SGID ci-dessous
```

#### 3.4.6 Bits spéciaux: SUID, SGID, Sticky

- SUID (4xxx): exécuter avec l'UID du propriétaire (bit sur `u`).
- SGID (2xxx): exécuter avec le GID du propriétaire (fichier) et, sur un dossier, force le groupe des nouveaux fichiers/dossiers créés dedans et propage le bit.
- Sticky (1xxx): sur un dossier, seuls propriétaire du fichier ou root peuvent supprimer/renommer (ex.: `/tmp`).

```bash
# SUID sur un binaire
sudo chmod u+s /usr/local/bin/outil     # équivaut à 4xxx
sudo chmod 4755 /usr/local/bin/outil
ls -l /usr/local/bin/outil
# -rwsr-xr-x ...  (s sur le triplet utilisateur)

# SGID sur un dossier de projet partagé
sudo groupadd dev
sudo install -d -m 2775 -o root -g dev /srv/projets
ls -ld /srv/projets
# drwxrwsr-x root dev ...  (s sur le triplet groupe)

# Sticky bit sur un dossier partagé (ex.: style /tmp)
sudo chmod 1777 /srv/public
ls -ld /srv/public
# drwxrwxrwt ...  (t en position autres)
```

Bonnes pratiques:
- Pour des dépôts d'équipe: `root:dev` + permissions `2775` sur le dossier racine pour que tous les nouveaux fichiers héritent du groupe `dev`.
- Éviter SUID non nécessaire (risques de sécurité).

#### 3.4.7 Propriété: chown et chgrp

```bash
# Changer propriétaire et groupe
sudo chown alice:dev fichier.txt
sudo chgrp dev dossier

# Appliquer récursivement
sudo chown -R root:dev /srv/projets

# Vérifier rapidement
stat -c "%U:%G %A %n" fichier.txt
# alice:dev -rw-r----- fichier.txt
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

## 5. Gestion des applications, mises à jour et services

### 5.1 Gestionnaire bas niveau: dpkg
But: gérer directement les paquets `.deb` (installation/suppression). Ne gère pas les dépendances.

```bash
# Installer un paquet local
sudo dpkg -i paquet.deb

# Supprimer un paquet (garde la configuration)
sudo dpkg -r nom_du_paquet

# Supprimer y compris les fichiers de configuration
sudo dpkg -P nom_du_paquet

# Lister les paquets installés
dpkg -l | less
```

### 5.2 Gestionnaire haut niveau: APT
But: installer/mettre à jour depuis des dépôts en résolvant les dépendances. Recommandé au quotidien.

```bash
# Mettre à jour l'index des paquets
sudo apt update

# Mettre à jour les paquets installés
sudo apt upgrade -y

# Installer / supprimer un paquet
sudo apt install nom_du_paquet -y
sudo apt remove nom_du_paquet -y

# Installer une version spécifique
sudo apt install nom_du_paquet=1.2.3-1
```

Note: `apt-get` est l'ancêtre de `apt`. Il reste supporté et courant dans la documentation.

### 5.3 Paquets universels: Snap
Paquets autonomes avec dépendances intégrées, exécutés en sandbox. Maintenus par Canonical, multiplateformes Linux.

```bash
# Rechercher une application
snap find nom_application

# Installer, mettre à jour
sudo snap install nom_application
sudo snap refresh                # toutes les apps Snap
sudo snap refresh nom_application
```

### 5.4 Mises à jour (manuelles et automatisées)

```bash
# Tout mettre à jour côté APT
sudo apt update && sudo apt upgrade -y

# Mettre à jour une app vers une version souhaitée
sudo apt update && sudo apt install nom_du_paquet=1.2.3-1 -y

# Mettre à jour toutes les apps Snap
sudo snap refresh
```

### 5.5 Mises à jour de sécurité: unattended-upgrades
Objectif: appliquer automatiquement les correctifs de sécurité sans intervention manuelle (recommandé sur serveurs).

Fichiers clés:
- `/etc/apt/apt.conf.d/50unattended-upgrades` (sélection des origines/typiques: security)
- `/etc/apt/apt.conf.d/20auto-upgrades` (fréquence/activation)

```bash
# Installer le package si besoin
sudo apt install unattended-upgrades -y

# Configurer (éditeur)
sudo nano /etc/apt/apt.conf.d/50unattended-upgrades
sudo nano /etc/apt/apt.conf.d/20auto-upgrades

# Activer/forcer la reconfig (assistant)
sudo dpkg-reconfigure --priority=low unattended-upgrades
```

Prudence: tester d'abord sur environnements non critiques pour éviter des effets de bord.

### 5.6 Services avec systemd
systemd gère le démarrage, l'arrêt et l'activation au boot des services.

```bash
# État d'un service
systemctl status ssh.service | cat

# Démarrer / arrêter / redémarrer
sudo systemctl start apache2.service
sudo systemctl stop apache2.service
sudo systemctl restart apache2.service

# Activer / désactiver au démarrage
sudo systemctl enable apache2.service
sudo systemctl disable apache2.service

# Lister les unités de type service
systemctl list-unit-files --type=service | cat
```

Astuce: le suffixe `.service` est souvent optionnel (`systemctl status ssh`).

### 5.7 Planification de tâches avec cron
Deux emplacements principaux:
- Tâches utilisateur: `/var/spool/cron/crontabs/`
- Tâches système: `/etc/crontab` (+ fichiers dans `/etc/cron.d/`)

Édition et affichage:

```bash
crontab -e    # éditer les tâches de l'utilisateur courant
crontab -l    # lister
```

Syntaxe: `mm hh d m dow [user] command`
- mm: minute (0-59)
- hh: heure (0-23)
- d: jour du mois (1-31)
- m: mois (1-12)
- dow: jour de semaine (0-7, 0/7=dimanche)

Caractères spéciaux: `*` (toutes valeurs), `,` (liste), `-` (plage), `/` (pas).

Schéma visuel des champs:

```text
# mm  hh  d   m   dow  [user]       command
#  |   |  |   |    |      |--> uniquement dans /etc/crontab et /etc/cron.d/
#  |   |  |   |    +--------- jour de semaine (0-7, 0/7=dimanche)
#  |   |  |   +-------------- mois (1-12)
#  |   |  +------------------ jour du mois (1-31)
#  |   +--------------------- heure (0-23)
#  +------------------------- minute (0-59)
```

Emplacements utiles:
- `/etc/crontab` et `/etc/cron.d/` requièrent la colonne `[user]`.
- `crontab -e` (utilisateur) n'inclut pas `[user]`.
- Répertoires: `/etc/cron.hourly`, `/etc/cron.daily`, `/etc/cron.weekly`, `/etc/cron.monthly` exécutent les scripts déposés dedans.

Raccourcis pratiques:

```bash
@reboot /usr/local/bin/script-au-demarrage.sh
@hourly /usr/local/bin/tache_heure.sh
@daily  /usr/local/bin/backup.sh
@weekly /usr/local/bin/rotation.sh
@monthly /usr/local/bin/bilan.sh
```

Conseils:
- Utiliser des chemins absolus (`/usr/bin/apt`, `/usr/bin/snap`) car l'environnement PATH de cron est limité.
- Rediriger la sortie vers des logs si besoin: `>> /var/log/cron.log 2>&1`.

Exemples (préférer un serveur de test):

```bash
# Tous les jours à 20:00: mises à jour APT
0 20 * * * /usr/bin/apt update && /usr/bin/apt upgrade -y

# Chaque dimanche à 03:30: mise à jour d'un Snap
30 3 * * 0 /usr/bin/snap refresh

# Toutes les 5 minutes
*/5 * * * * /usr/local/bin/collect-metrics.sh >> /var/log/metrics.log 2>&1

# Jours ouvrés à 09:00-17:00, toutes les 2 heures
0 9-17/2 * * 1-5 /usr/local/bin/envoi-rapport.sh

# Le 1er du mois à 01:15 (avec champ user dans /etc/crontab)
15 1 1 * * root /usr/local/bin/archiver.sh

# Listes et plages: à 00 et 30 min, entre 8h et 18h, du lundi au vendredi
0,30 8-18 * * 1-5 /usr/local/bin/sauvegarde-incr.sh
```

Ressource utile: [cron.help](https://cron.help)

## 6. Disques, partitions et montage

### 6.1 Découvrir les disques et partitions
Objectif: identifier les périphériques de blocs et voir leur structure.

```bash
lsblk -f                     # arborescence, types de FS et labels/UUID
sudo fdisk -l | less         # table de partitions détaillée (MBR/GPT)
blkid                        # lister UUID/LABEL par périphérique
sudo parted -l | cat         # vue GPT lisible (si parted installé)
```

Repères:
- Disques: `/dev/sda`, `/dev/sdb`, ...
- Partitions: `/dev/sdb1`, `/dev/sdb2`, ...
- Périphériques logiques LVM: `/dev/mapper/<vg>-<lv>` (non couvert en détail ici).

### 6.2 Partitionner un disque
Créer/modifier des partitions. Sur disque vide, choisir GPT de préférence.

```bash
# Avec fdisk (MBR/GPT basique)
sudo fdisk /dev/sdb
# n (nouvelle partition), p (primaire), w (écrire), q (quitter sans sauver)

# Relecture de table (si pas de reboot)
sudo partprobe /dev/sdb   # ou sudo kpartx -a /dev/sdb
```

Astuce: noter le secteur de début avant modification lors d'un redimensionnement manuel.

### 6.3 Formater (systèmes de fichiers)
Créer un système de fichiers sur une partition.

```bash
# ext4 (générique Linux)
sudo mkfs.ext4 -L DEV_DATA /dev/sdb1

# FAT32 (échange multi-OS)
sudo mkfs.vfat -F 32 -n WIN_SHARE /dev/sdc1

# NTFS (si besoin d'écrire depuis Linux)
sudo mkfs.ntfs -F -L WIN_NTFS /dev/sdd1
```

Vérification:
```bash
lsblk -f       # voir TYPE, LABEL, UUID
blkid /dev/sdb1
```

### 6.4 Monter et vérifier
Monter temporairement dans un répertoire dédié.

```bash
sudo mkdir -p /data/dev-data
sudo mount /dev/sdb1 /data/dev-data

# Vérifier
df -h | grep dev-data
mount | grep dev-data

# Droits de base
sudo chown -R root:dev /data/dev-data
sudo chmod 2775 /data/dev-data   # SGID pour héritage de groupe
```

### 6.5 Montage automatique avec fstab
Monter au démarrage via `/etc/fstab` en utilisant l'UUID pour fiabilité.

```bash
sudo blkid /dev/sdb1   # récupérer l'UUID
sudo nano /etc/fstab
```

Entrée type ext4:

```text
UUID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx  /data/dev-data  ext4  defaults  0  2
```

Entrée type vfat (FAT32):

```text
UUID=YYYY-YYYY  /mnt/win-share  vfat  uid=1000,gid=1000,umask=002,utf8  0  0
```

Validation:
```bash
sudo mount -a      # tester la syntaxe fstab
df -h | grep -E '/data/dev-data|/mnt/win-share'
```

### 6.6 Redimensionner une partition et un FS
Étendre la partition puis le système de fichiers (sans reformatage).

```bash
# 1) Vérifier la nouvelle taille du disque (ex.: disque étendu dans l'hyperviseur)
lsblk

# 2) Ajuster la partition (conserver le même début, étendre la fin)
sudo fdisk /dev/sdb
# supprimer la partition puis la recréer à l'identique avec fin étendue, puis w

# 3) Relecture de la table
sudo partprobe /dev/sdb   # ou reboot

# 4) Étendre le FS (ext4)
sudo resize2fs /dev/sdb1

# 5) Contrôles
df -h | grep dev-data
```

Remarques:
- Pour XFS, utiliser `xfs_growfs` (monté) au lieu de `resize2fs`.
- Toujours effectuer des sauvegardes avant des opérations de partitionnement.

### 6.7 Partage avec Windows (FAT32/NTFS)
Cas d'usage: partition d'échange lisible par Windows.

```bash
sudo mkdir -p /mnt/win-share
sudo mkfs.vfat -F 32 -n WIN_SHARE /dev/sdc1

# fstab (FAT32)
UUID=YYYY-YYYY  /mnt/win-share  vfat  uid=1000,gid=1000,umask=002,utf8  0  0

# Monter maintenant
sudo mount -a
```

Pour NTFS, installer le pilote:

```bash
sudo apt install ntfs-3g -y
sudo mkfs.ntfs -F -L WIN_NTFS /dev/sdc1
```

## 7. Partage de fichiers: NFS et Samba

### 7.1 Contexte et objectifs
Dans une PME mixte Windows/Ubuntu, on souhaite centraliser un partage de fichiers sur Ubuntu Server.
\- Accès Linux via NFS (intégration POSIX, performant en LAN).
\- Accès Windows via Samba/SMB (protocole natif Windows).

### 7.2 NFS côté serveur (Ubuntu Server)
```bash
# Installer NFS serveur
sudo apt update && sudo apt install -y nfs-kernel-server

# Dossier exporté
sudo mkdir -p /srv/partage_nfs
sudo chown root:root /srv/partage_nfs
# Permissif pour labo (évite problèmes d'UID/GID). À durcir en prod.
sudo chmod 0777 /srv/partage_nfs

# Autoriser un client précis (ex.: 10.10.2.43)
echo "/srv/partage_nfs 10.10.2.43(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports

# (ré)exporter et activer le service
sudo exportfs -ra
sudo systemctl enable --now nfs-kernel-server

# (si UFW actif) autoriser le client
sudo ufw allow from 10.10.2.43 to any port nfs || true
```

### 7.3 NFS côté client (Ubuntu Desktop)
```bash
sudo apt update && sudo apt install -y nfs-common
sudo mkdir -p /mnt/nfs_share

# Monter le partage (NFSv4)
sudo mount -t nfs4 <SERVER_IP>:/srv/partage_nfs /mnt/nfs_share

# Test
echo "hello-nfs" | sudo tee /mnt/nfs_share/test.txt
ls -l /mnt/nfs_share

# (option) montage automatique
echo "<SERVER_IP>:/srv/partage_nfs /mnt/nfs_share nfs4 defaults,_netdev 0 0" | sudo tee -a /etc/fstab
```

Conseil: si `exportfs -ra` remonte une duplication, nettoyer `/etc/exports` et `/etc/exports.d/*.exports` pour ne garder qu'une seule ligne par export.

```bash
# Nettoyage duplication d'exports (exemple)
sudo cp /etc/exports /etc/exports.bak.$(date +%F_%H%M)
sudo sed -i '\|^/srv/partage_nfs|d' /etc/exports
sudo find /etc/exports.d -maxdepth 1 -type f -exec sudo sed -i '\|^/srv/partage_nfs|d' {} +
echo "/srv/partage_nfs 10.10.2.43(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports
sudo exportfs -ua && sudo exportfs -ra && sudo exportfs -v
```

### 7.4 Samba côté serveur (Ubuntu Server)
```bash
# Installer Samba
sudo apt update && sudo apt install -y samba

# Créer un utilisateur système (sans mot de passe shell) et Samba
sudo adduser --disabled-password smbuser
echo -e "<SMB_PASS>\n<SMB_PASS>" | sudo smbpasswd -a smbuser

# Dossier partagé
sudo mkdir -p /srv/partage_samba
sudo chown smbuser:smbuser /srv/partage_samba
sudo chmod 2770 /srv/partage_samba

# Sauvegarder et compléter la configuration
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo bash -c 'cat >>/etc/samba/smb.conf << "EOF"\n\n[partage-samba]\n   path = /srv/partage_samba\n   browseable = yes\n   read only = no\n   valid users = smbuser\n   create mask = 0660\n   directory mask = 0770\nEOF'

# Redémarrer et activer
sudo systemctl enable --now smbd
sudo systemctl restart smbd

# (si UFW actif)
sudo ufw allow "Samba" || true
```

### 7.5 Client Windows 11 vers Samba
\- Explorateur: saisir `\\<SERVER_IP>\partage-samba` puis s'authentifier `smbuser` / `<SMB_PASS>`.

Montage en lecteur `Z:` (PowerShell, persistant):
```powershell
net use Z: \\<SERVER_IP>\partage-samba /user:smbuser <SMB_PASS> /persistent:yes
```

### 7.6 Client Linux vers Samba (optionnel)
```bash
sudo apt install -y cifs-utils
sudo mkdir -p /mnt/smb
sudo mount -t cifs //<SERVER_IP>/partage-samba /mnt/smb -o username=smbuser,vers=3.0,uid=$(id -u),gid=$(id -g)

# (option) fstab
echo "//<SERVER_IP>/partage-samba /mnt/smb cifs username=smbuser,vers=3.0,uid=1000,gid=1000,_netdev 0 0" | sudo tee -a /etc/fstab
```

### 7.7 Dépannage et cas courants
- Permissions NFS insuffisantes: côté serveur, pour un labo, `sudo chmod 777 /srv/partage_nfs` puis `sudo exportfs -ra`. Pour un contrôle fin: options d'export (`rw`, `root_squash`/`no_root_squash`).
- Duplication d'exports: messages `exportfs: duplicated export entries` → nettoyer `/etc/exports` et `/etc/exports.d/`, puis `exportfs -ua && exportfs -ra`.
- Vérifs rapides:
  - NFS client: `showmount -e <SERVER_IP>`, `mount | grep nfs`.
  - Samba serveur: `sudo smbstatus -S`.
- Pare-feu: ouvrir NFS pour l'IP cliente, ou le profil `Samba`.

### 7.8 Bonnes pratiques et différences
- Samba pour Windows: SMB/CIFS natif, intégration AD possible (groupes/ACL NTFS).
- NFS pour Linux: respect des UID/GID POSIX, perfs LAN, simplicité.
- Production: éviter `0777` et `no_root_squash`; préférer contrôles par IP, UID/GID cohérents, groupes dédiés, sauvegardes et journaux.

## 8. DHCP: principes et mise en place (Kea)

### 8.1 Rappels sur DHCP (IPv4)
- Objectif: attribution automatique de l'IP, masque, passerelle et DNS.
- Ports: serveur 67/UDP, client 68/UDP (broadcast initial).
- Échanges DORA (simplifié):

```text
Client →       DHCP Discover (qui peut me configurer ?)
        ← Serveur: DHCP Offer (voici une offre d'IP + options)
Client →       DHCP Request (je veux cette offre)
        ← Serveur: DHCP Ack (confirmation + durée du bail)
```

- Durée de bail: timers `T1` (~50%) et `T2` (~87.5%) pour renouveler avant expiration.

### 8.2 Installation du serveur Kea (Ubuntu 24.04)
```bash
# Dépôt officiel ISC (Kea 3.0 LTS)
curl -1sLf 'https://dl.cloudsmith.io/public/isc/kea-3-0/setup.deb.sh' | sudo -E bash

sudo apt update
sudo apt install -y isc-kea

# (optionnel) accès aux logs/fichiers
sudo usermod -aG _kea "$USER"
```

### 8.3 Configuration minimale DHCPv4
Fichier: `/etc/kea/kea-dhcp4.conf` (sauvegarder l'original en `.bkp`).

Exemple pour `10.10.10.0/24` (pool, routeur, DNS):
```json
{
  "Dhcp4": {
    "interfaces-config": { "interfaces": ["ens33"] },
    "lease-database": { "type": "memfile", "persist": true, "name": "/var/lib/kea/dhcp4.leases" },
    "valid-lifetime": 28800,
    "subnet4": [{
      "id": 1,
      "subnet": "10.10.10.0/24",
      "pools": [ { "pool": "10.10.10.10 - 10.10.10.250" } ],
      "option-data": [
        { "name": "routers", "data": "10.10.10.2" },
        { "name": "domain-name-servers", "data": "8.8.8.8" }
      ]
    }],
    "loggers": [{ "name": "kea-dhcp4", "output_options": [{ "output": "/var/log/kea/kea-dhcp4.log" }], "severity": "INFO" }]
  }
}
```
Notes: adapter l'interface (`ens33`, `ens160`, ...). Le champ `id` du `subnet4` est requis.

Options utiles (exemples dans `option-data`):
- `routers`: passerelle par défaut.
- `domain-name-servers`: liste de DNS.
- `domain-name`: suffixe DNS local (ex.: `lan.local`).

### 8.4 Démarrer et activer le service
```bash
sudo systemctl enable --now isc-kea-dhcp4-server
systemctl status isc-kea-dhcp4-server | cat
```

### 8.5 Tests côté client
```bash
nmcli device status
sudo nmcli device show <interface>

# Relancer l'obtention d'IP
sudo nmcli device disconnect <interface>
sudo nmcli device connect <interface>

sudo apt install -y isc-dhcp-client
sudo dhclient -r <interface>   # release
sudo dhclient -v <interface>   # renew (verbeux)
```

Diagnostics rapides:
- IP obtenue mais pas d'Internet: vérifier route par défaut (`ip route`) et DNS (ping IP vs nom de domaine).
- Pas d'IP: vérifier que le serveur écoute sur la bonne interface, que le DHCP concurrent (ex.: VMware) est désactivé, et consulter les logs Kea.

### 8.6 Journaux et baux
```bash
sudo tail -f /var/log/kea/kea-dhcp4.log
sudo tail -f /var/lib/kea/dhcp4.leases
```

### 8.7 Réservations par adresse MAC
Dans le bloc `subnet4`, ajouter `reservations`:
```json
"reservations": [
  { "hw-address": "aa:bb:cc:dd:ee:ff", "ip-address": "10.10.10.50" }
]
```
Puis appliquer:
```bash
sudo systemctl restart isc-kea-dhcp4-server
```

### 8.8 Bonnes pratiques et dépannage
- Désactiver tout autre DHCP sur le même segment (ex.: DHCP VMware).
- Vérifier l'interface dans `interfaces-config` et ouvrir 67/UDP si pare-feu actif.
- En production: rotation des logs, sauvegardes, cohérence d'adressage, documenter les réservations.

## 9. DNS: principes et mise en place (BIND 9)

### 9.1 Concepts DNS
- Rôle: résolution de noms ↔ adresses IP (annuaire du réseau). Un résolveur interroge un ou plusieurs serveurs pour obtenir la réponse.
- Types courants: A/AAAA (adresse), CNAME (alias), NS (serveur de noms), PTR (reverse), MX (mail), TXT (infos diverses).
- Zones: directe (forward) pour noms→IP, inverse (reverse) pour IP→noms. Chaque zone est servie par au moins un serveur faisant autorité.
- TTL: durée pendant laquelle une réponse peut être gardée en cache (important pour la propagation et la charge).

### 9.2 Installation de BIND 9
```bash
sudo apt update && sudo apt install -y bind9 bind9-utils bind9-doc

# IPv4 uniquement
echo 'OPTIONS="-u bind -4"' | sudo tee /etc/default/named >/dev/null

sudo systemctl enable --now named
systemctl status named --no-pager -l | cat
```

### 9.3 Configuration des zones (forward et reverse)
Fichier `/etc/bind/named.conf.local`:
```conf
zone "emf300.local" {
  type primary;
  file "/etc/bind/db.emf300.local";
};

zone "10.10.10.in-addr.arpa" {
  type primary;
  file "/etc/bind/db.10.10.10";
};
```

Zone directe `/etc/bind/db.emf300.local` (faisant autorité sur `emf300.local`):
```conf
$TTL 1h
@   IN SOA srv-keabind-01.emf300.local. admin.emf300.local. (
        2025090101 ; Serial
        1h         ; Refresh
        15m        ; Retry
        1w         ; Expire
        1h )       ; Negative Cache TTL

@                       IN NS   srv-keabind-01.emf300.local.
@                       IN A    10.10.10.5
srv-keabind-01.emf300.local. IN A 10.10.10.5
dhcp                    IN CNAME srv-keabind-01.emf300.local.
```

Zone inverse `/etc/bind/db.10.10.10` (résolution IP→nom pour 10.10.10.0/24):
```conf
$TTL 1h
@   IN SOA srv-keabind-01.emf300.local. admin.emf300.local. (
        2025090101 ; Serial
        1h ; Refresh
        15m ; Retry
        1w ; Expire
        1h ) ; Negative Cache TTL
@                       IN NS   srv-keabind-01.emf300.local.
5                       IN PTR  srv-keabind-01.emf300.local.
```

### 9.4 Options globales et sécurité
Éditer `/etc/bind/named.conf.options`:
```conf
acl "trusted" {
  10.10.10.0/24;
  127.0.0.1;
};

options {
  directory "/var/cache/bind";

  recursion no;                   // autoritaire par défaut
  allow-recursion { trusted; };
  listen-on { 10.10.10.5; 127.0.0.1; };
  allow-transfer { none; };
  dnssec-validation auto;
  listen-on-v6 { none; };
}
```

### 9.5 Vérification, rechargement et tests
```bash
sudo named-checkconf
sudo named-checkzone emf300.local /etc/bind/db.emf300.local
sudo named-checkzone 10.10.10.in-addr.arpa /etc/bind/db.10.10.10

sudo systemctl reload named

# Tests (serveur)
dig @127.0.0.1 srv-keabind-01.emf300.local A +short
dig @127.0.0.1 -x 10.10.10.5 +short
```

### 9.6 Intégration avec DHCP (options Kea)
Pousser DNS + suffixe via Kea dans `option-data` du `subnet4`:
```json
{
  "name": "domain-name-servers", "data": "10.10.10.5"
},
{
  "name": "domain-name", "data": "emf300.local"
}
```
Côté client, renouveler le bail (`dhclient -r` puis `dhclient -v`).

### 9.7 Résolution récursive et forwarders
- Récursif: dans `named.conf.options`, passer `recursion yes;` puis recharger.
- Forwarder: ajouter un redirecteur, ex. Google DNS.

```conf
options {
  // ...
  recursion yes;
  forwarders { 8.8.8.8; };
}
```

Tests côté client:
```bash
dig www.cff.ch +short
```

### 9.8 Bonnes pratiques et dépannage
- Incrémenter le Serial à chaque modification de zone.
- Limiter `allow-recursion` aux hôtes de confiance, éviter un résolveur ouvert.
- Vérifier l’écoute sur 53/UDP (`ss -ulpn | grep :53`).
- CNAME vs A: un CNAME (ex. `dhcp`) pointe vers un A (ex. `srv-keabind-01`).

### 9.9 Enregistrements SOA et gestion du Serial
- SOA (Start of Authority) définit l’autorité et les timers d’une zone (refresh/retry/expire/negative TTL).
- Le champ `Serial` doit être incrémenté à chaque changement de zone. Convention fréquente: `YYYYMMDDNN`.
- Si le Serial n’augmente pas, BIND recharge localement mais les secondaires (le cas échéant) ne prennent pas la nouvelle version.

### 9.10 DNS et transport (UDP/TCP), transferts de zone
- Requêtes classiques: UDP/53. Repli en TCP/53 si la réponse est tronquée (flag TC) ou pour certaines opérations.
- Transferts de zone: `AXFR` (full) et `IXFR` (incrémental) utilisent TCP; par défaut on les bloque (`allow-transfer { none; }`) en environnement simple pour éviter la fuite d’infos.
- Ouvrir sélectivement les transferts vers des secondaires autorisés si nécessaire.

### 9.11 Diagnostics avancés (dig, journalisation, tests)
```bash
# Inspection détaillée
dig @127.0.0.1 emf300.local SOA +multi +nocomments
dig @127.0.0.1 srv-keabind-01.emf300.local A +ttlunits
dig @127.0.0.1 -x 10.10.10.5 PTR +ttlunits

# Traçage récursif (utile pour comprendre la résolution Internet)
dig +trace www.cff.ch

# Logs BIND (journalctl)
sudo journalctl -u named -e | cat
```

## 10. Références
- Documentation Ubuntu: https://help.ubuntu.com
- Debian Handbook: https://debian-handbook.info
- Arch Wiki (référence générale): https://wiki.archlinux.org
- Exemples de commandes et fichiers de config : https://openai.com


