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
- [6. Références](#6-références)

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

Exemples (préférer un serveur de test):

```bash
# Tous les jours à 20:00: mises à jour APT
0 20 * * * /usr/bin/apt update && /usr/bin/apt upgrade -y

# Chaque dimanche à 03:30: mise à jour d'un Snap
30 3 * * 0 /usr/bin/snap refresh
```

Ressource utile: [cron.help](https://cron.help)

## 6. Références
- Documentation Ubuntu: https://help.ubuntu.com
- Debian Handbook: https://debian-handbook.info
- Arch Wiki (référence générale): https://wiki.archlinux.org


