---
title: Première partie - Terraform avec OpenStack
date: 2018-01-25
disqus_url: http://blog.ledez.net/informatique/devops/premiere-partie-terraform-avec-openstack/
layout: post
url: /informatique/devops/premiere-partie-terraform-avec-openstack/
tags:
  - DevOps
  - openstack
  - ovhpubliccloud
  - terraform
  - ansible
excerpt_separator: <!--more-->
---
{{< figure src="/images/2018/01/LogoArticlesPC_Terraform_Ansible_Consul_HAProxy.png" title="PCi, Terraform, Ansible, Consul & Co." >}}

OK, donc c'est partit !

On va commencer avec Terraform. C'est simple, installe [Terraform](https://www.terraform.io/downloads.html) dans ton PATH.

<!--more-->

Vérifie que la partie [OpenStack](https://www.terraform.io/docs/providers/openstack/index.html) est bien configurée.

Clone [mon entrepôt Git](https://github.com/nledez/consul-laboratory) sur ta machine :

{{< highlight bash >}}
$ git clone https://github.com/nledez/consul-laboratory.git
$ cd consul-laboratory
$ ls
README.md                            provision.yml                        terraform.tfvars-example
inventory.ini-example                public-cloud-ovh.auto.tfvars-example variable.tf
main.tf                              requirements.yml
provider.tf                          scripts
{{< / highlight >}}

Copie les fichiers d'exemple :

{{< highlight bash >}}
$ cp public-cloud-ovh.auto.tfvars-example public-cloud-ovh.auto.tfvars
$ cp terraform.tfvars-example terraform.tfvars
{{< / highlight >}}

Maintenant, connecte-toi au [manager OVH](https://www.ovh.com/manager/web/login.html) :

{{< figure src="/images/2018/01/post_01_terraform/01-manager.png" title="OVH Manager" >}}

Comme je l'avais dit dans l'article précédent, il faut un projet public cloud avec le Vrack de connecté :

{{< figure src="/images/2018/01/post_01_terraform/02-publiccloud.png" title="Public Cloud" >}}

Clique sur Openstack :

{{< figure src="/images/2018/01/post_01_terraform/03-openstack.png" title="Openstack" >}}

Ensuite sur ajouter un utilisateur :

{{< figure src="/images/2018/01/post_01_terraform/04-add-user.png" title="Ajouter un utilisateur" >}}

L'utilisateur est crée :

{{< figure src="/images/2018/01/post_01_terraform/05-user-added.png" title="Utilisateur crée" >}}

Note bien le mot de passe. C'est le seul moment ou il est affiché. Ensuite, impossible de le retrouver, il faudrait en générer un nouveau (juste le mot de passe).

On va maintenant créer un fichier `openrc.sh` qui va contenir les paramètres openstack :

{{< figure src="/images/2018/01/post_01_terraform/06-create-openrc.png" title="Créer un fichier openrc.sh" >}}

On choisi le datacenter :

{{< figure src="/images/2018/01/post_01_terraform/07-select-datacenter.png" title="Choix du datacenter" >}}

On met le fichier avec les autres :

{{< highlight bash >}}
$ mv ~/Download/openrc.sh openrc.sh
# on charge les variables d'environnement (à chaque nouveau shell):
$ source openrc.sh
$ vi -p openrc.sh public-cloud-ovh.auto.tfvars
{{< / highlight >}}

On va remplir les fichiers :

public-cloud-ovh.auto.tfvars :

{{< highlight ini >}}
"user_name" = "z9gQ4eJEhG7z"
"tenant_name" = "5898292172448309"
"password" = "AeG6gpgpEjmV9MU52H3eneP6ub74Tt3k"
{{< / highlight >}}

User name c'est la partie de gauche dans le manager OVH.
Le password, c'est la partie de droite qui va être cachée.

Le tenant_name correspond à la variable `OS_TENANT_NAME` dans le fichier openrc.sh

Et moi, je met ça dans le openrc.sh :

{{< highlight bash >}}
export OS_PASSWORD="AeG6gpgpEjmV9MU52H3eneP6ub74Tt3k"
{{< / highlight >}}

Bon, il ne faut surtout pas mettre ça sur Github et ne pas partager le fichier.

Ensuite, lance :

{{< highlight bash >}}
# Initialisation des "plugins" Terraform :
$ terraform init
# affiche le plan Terraform :
$ terraform plan
# applique les changements :
$ terraform apply
{{< / highlight >}}

On va vérifier qu'Ansible arrive bien à générer un inventory automatiquement :

{{< highlight bash >}}
$ terraform-inventory --list terraform.tfstate | jq
{
  "consul": [
    "54.37.21.101",
    "54.37.21.139",
    "54.37.21.129"
  ],
  "consul-client": [
    "54.37.21.107"
  ],
  "consul-client.0": [
    "54.37.21.107"
  ],
  "consul.0": [
    "54.37.21.101"
  ],
  "consul.1": [
    "54.37.21.139"
  ],
  "consul.2": [
    "54.37.21.129"
  ],
  "type_openstack_compute_instance_v2": [
    "54.37.21.107",
    "54.37.21.101",
    "54.37.21.139",
    "54.37.21.129"
  ]
}
{{< / highlight >}}

Bien sûr pour que cela fonctionne, il faut installer [terraform-inventory](https://github.com/adammck/terraform-inventory).

Maintenant test un ping des vm en acceptant les clées SSH :

{{< highlight bash >}}
$ export ANSIBLE_NOCOWS=1
$ export ANSIBLE_REMOTE_USER=ubuntu
$ export ANSIBLE_HOSTS=$(which terraform-inventory)
$ ansible --ssh-extra-args='-o StrictHostKeyChecking=no' all -m ping
# maintenant cela doit fonctionner sans le ssh-extra-args :
$ ansible all -m ping
{{< / highlight >}}

Il parait que dans certains cas, la ligne avec le `StrictHostKeyChecking=no` n'est pas indispensable. Ansible pourrait le faire tout seul. Sauf que chez moi non (et chez toi ?).

C'est maintenant la fin de cet article. Tu es peut-être triste. Mais moi fatigué. Je ferais donc la suite un autre jour :)

Je ne vais pas te laisser là quand même. Si tu veux détruire les VM pour économiser un peu de sous avant la prochaine :

{{< highlight bash >}}
$ terraform destroy
{{< / highlight >}}

Et puis tu peux voir [le screen cast sur Youtube](https://www.youtube.com/watch?v=m8xJCi8XoU4&feature=youtu.be).

{{< youtube m8xJCi8XoU4 >}}

Alors, je suis déçu par la qualité de cette première :

- Image crado
- Son super bas

Promis la prochaine sera meilleure !
