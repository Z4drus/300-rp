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
- [8. Références](#8-références)

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

## 8. Références
- Documentation Ubuntu: https://help.ubuntu.com
- Debian Handbook: https://debian-handbook.info
- Arch Wiki (référence générale): https://wiki.archlinux.org


