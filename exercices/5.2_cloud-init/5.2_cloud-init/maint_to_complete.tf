terraform {
  required_providers {
    exoscale = {
      source = "exoscale/exoscale"
    }
  }
}

# Astuce: plutôt utiliser les variables d'env EXOSCALE_API_KEY / EXOSCALE_API_SECRET
provider "exoscale" {
  key    = "EXO8b565002409957d2f1f243be"
  secret = "tK9UZ-2lHElEmXyUwlv8bSaPWLVfBZoqQbOwG1IoY0Y"
}

# Clé SSH: nom demandé + clé publique générée à l’étape 1
resource "exoscale_ssh_key" "my_ssh_key" {
  name       = "300-classe-romanens-noe-key"
  public_key = file(pathexpand("~/.ssh/300-classe-romanens-noe_ed25519.pub"))
}

resource "exoscale_compute_instance" "my_instance" {
  zone               = "ch-gva-2"
  name               = "300-classe-ubuntu-romanens-noe"
  template_id        = "4395dec0-e9d3-4bda-ad06-4e7fc7457464" # Ubuntu 24.04 LTS
  type               = "standard.small"
  disk_size          = 20
  security_group_ids = ["806f6bde-e106-4053-9d50-4547522cc048"] # SG par défaut HTTP/HTTPS/SSH
  ssh_keys           = [exoscale_ssh_key.my_ssh_key.name]

  # Cloud-init: installe nginx, active au boot, crée /data, page web perso
  user_data = <<-EOF
  #cloud-config
  package_update: true
  package_upgrade: true
  packages:
    - nginx

  write_files:
    - path: /var/www/html/index.html
      owner: www-data:www-data
      permissions: "0644"
      content: |
        <!doctype html>
        <html lang="fr">
        <head><meta charset="utf-8"><title>OK</title></head>
        <body style="font-family:sans-serif">
          <h1>Exercice Cloud-Init ✅</h1>
          <p>Serveur: 300-classe-ubuntu-romanens-noe</p>
          <p>Nginx installé & lancé, /data créé.</p>
        </body>
        </html>

  runcmd:
    - systemctl enable --now nginx
    - mkdir -p /data

  final_message: "Cloud-init terminé. Nginx opérationnel. /data créé."
  EOF
}

output "public_ip" {
  value = exoscale_compute_instance.my_instance.public_ip_address
}
