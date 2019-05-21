---
date: 2012-02-19
title: Vagrant ou les VM pour les nuls
disqus_url: http://blog.ledez.net/informatique/vagrant-ou-les-vm-pour-les-nuls/
url: /informatique/vagrant-ou-les-vm-pour-les-nuls/
tags:
  - Informatique
  - vagran
  - virtualisation
  - vm
excerpt_separator: <!--more-->
---
{{< figure src="/images/2012/02/vagrant_chilling-300x300.png" title="Vagrant" >}}

Pour un administrateur système, la virtualisation est un super jouet.

Et pour un développeur cela peut devenir un super outil, mais tellement compliqué à mettre en place.

Et c'est là que Vagrant arrive à la rescousse :

* Pas d'installation d'OS
* Pas de réseau à gérer
* Partage de fichier simplifié

Bref, c'est dégoutant de simplicité pour un administrateur système.

Mais (il en faut bien un), la prise en main n'est pas forcement très simple...

<!--more-->

### Les termes à comprendre

  * Box
  * Package

Box : en gros, c'est simplement un modèle décompressé de VM. Vagrant va s'en servir pour déployer des VM.

Package : c'est la version compressée d'un modèle de VM.

On télécharge un package pour l'installer en tant que box. Une instance de VM peut être convertie en package.

{{< figure src="/images/2012/02/vagrant.png" title="Workflow Vagrant" >}}

### Installation de VirtualBox

{{< figure src="/images/2012/02/vbox_logo2_gradient.png" title="Virtual Box" >}}

La première chose à faire est d'installer Virtual Box : direction [le site de Virtual Box][1]. Prenez l'installeur qui correspond à votre système d'exploitation. Attention Vagrant ne supporte que les versions VirtualBox 4.0.x et 4.1.x. Il y a peut-être une solution pour votre distribution Linux du style package tout prêt. Et je ne sais absolument pas ce que ça donne sous Windows.

### Installation de Vagrant

{{< highlight bash >}}
$ rvm use 1.9.3@vagrant --create
$ gem install vagrant
{{< / highlight >}}

### Installation d'une VM par défaut

Pour la première VM on va utiliser un package d'Internet.

{{< highlight bash >}}
$ vagrant box add lucid64 http://files.vagrantup.com/lucid64.box
{{< / highlight >}}

### Première VM

{{< highlight bash >}}
$ vagrant init
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
{{< / highlight >}}

Vous pouvez simplifier le fichier Vagrantfile :

{{< highlight ruby >}}
Vagrant::Config.run do |config|
  config.vm.box = "base"
  # config.vm.boot_mode = :gui
end
{{< / highlight >}}

Pensez à remplacer la ligne :

{{< highlight ruby >}}
config.vm.box = "base"
{{< / highlight >}}

Par notre box installé tout à l'heure :

{{< highlight ruby >}}
config.vm.box = "lucid64"
{{< / highlight >}}

Et maintenant lancer la création de la VM. Attention c'est magique :) :

{{< highlight bash >}}
$ vagrant up
[default] Importing base box 'lucid64'...
[default] Progress: 60%
[default] Matching MAC address for NAT networking...
[default] Clearing any previously set forwarded ports...
[default] Fixed port collision for 22 => 2222. Now on port 2200.
[default] Forwarding ports...
[default] -- 22 => 2200 (adapter 1)
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Booting VM...
[default] Waiting for VM to boot. This can take a few minutes.
[default] VM booted and ready for use!
[default] Mounting shared folders...
[default] -- v-root: /vagrant
{{< / highlight >}}

Notre machine est prête :

{{< highlight bash >}}
$ vagrant ssh
Linux lucid64 2.6.32-33-server #70-Ubuntu SMP Thu Jul 7 22:28:30 UTC 2011 x86_64 GNU/Linux
Ubuntu 10.04.3 LTS

vagrant@lucid64:~$
{{< / highlight >}}

Et voilà !

Pour arrêter notre VM, on sort du SSH et :

{{< highlight bash >}}
$ vagrant halt
[default] Attempting graceful shutdown of VM...
{{< / highlight >}}

### Mettre à jour une box

Quand j'ai essayé Vagrant hier, je suis tombé sur cette erreur :

{{< highlight bash >}}
[default] The guest additions on this VM do not match the install version of
VirtualBox! This may cause things such as forwarded ports, shared
folders, and more to not work properly. If any of those things fail on
this machine, please update the guest additions and repackage the
box.

Guest Additions Version: 4.1.0
VirtualBox Version: 4.1.8
{{< / highlight >}}

J'ai trouvé pas mal de solutions, mais trop compliqué et/ou qui télécharges les MAJ sur Internet. Moi je fais comme ça :  
Un petit backup :

{{< highlight bash >}}
$ tar cvzf ~/.vagrant.d/backup/lucid64.tgz ~/.vagrant.d/boxes/lucid64
tar: Removing leading '/' from member names
a ~/.vagrant.d/boxes/lucid64
a ~/.vagrant.d/boxes/lucid64/box-disk1.vmdk
a ~/.vagrant.d/boxes/lucid64/box.mf
a ~/.vagrant.d/boxes/lucid64/box.ovf
a ~/.vagrant.d/boxes/lucid64/Vagrantfile
{{< / highlight >}}

Dé-commenter la ligne suivante dans le fichier Vagrantfile :

{{< highlight ruby >}}
config.vm.boot_mode = :gui
{{< / highlight >}}

{{< highlight bash >}}
$ vagrant destroy
$ vagrant up
$ vagrant ssh
{{< / highlight >}}

La fenêtre de la VM va s'ouvrir en parallèle. Sélectionner cette fenêtre et dans le menu « Périphérique / installer les additions invitées »

Donc maintenant nous sommes dans la VM :

{{< highlight bash >}}
vagrant@lucid64:~$ sudo mount /dev/sr0 /mnt
mount: block device /dev/sr0 is write-protected, mounting read-only
vagrant@lucid64:~$ sudo /mnt/VBoxLinuxAdditions.run
Verifying archive integrity... All good.
Uncompressing VirtualBox 4.1.8 Guest Additions for Linux..........
VirtualBox Guest Additions installer
Removing installed version 4.1.0 of VirtualBox Guest Additions...
tar: Record size = 8 blocks
Removing existing VirtualBox DKMS kernel modules ...done.
Removing existing VirtualBox non-DKMS kernel modules ...done.
Building the VirtualBox Guest Additions kernel modules
The headers for the current running kernel were not found. If the following
module compilation fails then this could be the reason.

Building the main Guest Additions module ...fail!
(Look at /var/log/vboxadd-install.log to find out what went wrong)
Doing non-kernel setup of the Guest Additions ...done.
Installing the Window System drivers ...fail!
(Could not find the X.Org or XFree86 Window System.)
{{< / highlight >}}

Un petit tour dans le fichier /var/log/vboxadd-install.log nous dis qu'il manque les headers du noyau. Pour les installer :

{{< highlight bash >}}
vagrant@lucid64:~$ sudo apt-get install linux-headers-$(uname -r) -y
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following extra packages will be installed:
  linux-headers-2.6.32-33
The following NEW packages will be installed:
  linux-headers-2.6.32-33 linux-headers-2.6.32-33-server
0 upgraded, 2 newly installed, 0 to remove and 5 not upgraded.
Need to get 10.7MB of archives.
After this operation, 85.5MB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu/ lucid-updates/main linux-headers-2.6.32-33 2.6.32-33.70 [9924kB]
Get:2 http://us.archive.ubuntu.com/ubuntu/ lucid-updates/main linux-headers-2.6.32-33-server 2.6.32-33.70 [800kB]
Fetched 10.7MB in 41s (255kB/s)
Selecting previously deselected package linux-headers-2.6.32-33.
(Reading database ... 26603 files and directories currently installed.)
Unpacking linux-headers-2.6.32-33 (from .../linux-headers-2.6.32-33_2.6.32-33.70_all.deb) ...
Selecting previously deselected package linux-headers-2.6.32-33-server.
Unpacking linux-headers-2.6.32-33-server (from .../linux-headers-2.6.32-33-server_2.6.32-33.70_amd64.deb) ...
Setting up linux-headers-2.6.32-33 (2.6.32-33.70) ...
Setting up linux-headers-2.6.32-33-server (2.6.32-33.70) ...

vagrant@lucid64:~$ sudo /etc/init.d/vboxadd
Usage: /etc/init.d/vboxadd {start|stop|restart|status|setup}
vagrant@lucid64:~$ sudo /etc/init.d/vboxadd setup
Removing existing VirtualBox DKMS kernel modules ...done.
Removing existing VirtualBox non-DKMS kernel modules ...done.
Building the VirtualBox Guest Additions kernel modules
Building the main Guest Additions module ...done.
Building the shared folder support module ...done.
Building the OpenGL support module ...done.
Doing non-kernel setup of the Guest Additions ...done.
You should restart your guest to make sure the new modules are actually used
{{< / highlight >}}

Un petit reboot pour vérifier que ça fonctionne :

{{< highlight bash >}}
$ vagrant halt
[default] Attempting graceful shutdown of VM...
$ vagrant up
[default] VM already created. Booting if it's not already running...
[default] Clearing any previously set forwarded ports...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Booting VM...
[default] Waiting for VM to boot. This can take a few minutes.
[default] VM booted and ready for use!
[default] Mounting shared folders...
[default] -- v-root: /vagrant
{{< / highlight >}}

Maintenant, transformer la VM en package :

{{< highlight bash >}}
$ vagrant package
[default] Attempting graceful shutdown of VM...
[default] Clearing any previously set forwarded ports...
[default] Creating temporary directory for export...
[default] Exporting VM...
[default] Compressing package to: ~/Vagrant/template/package.box
{{< / highlight >}}

Et installer le nouveau package pour remplacer la box :

{{< highlight bash >}}
$ vagrant box remove lucid64
[vagrant] Deleting box 'lucid64'...

$ vagrant box add lucid64 package.box
[vagrant] Downloading with Vagrant::Downloaders::File...
[vagrant] Copying box to temporary location...
[vagrant] Extracting box...
[vagrant] Verifying box...
[vagrant] Cleaning up downloaded box...
{{< / highlight >}}

Maintenant, re-commenter la ligne suivante dans le fichier Vagrantfile :

{{< highlight ruby >}}
config.vm.boot_mode = :gui
{{< / highlight >}}

Pour essayer si la nouvelle box fonctionne :

{{< highlight bash >}}
$ vagrant destroy
[default] Destroying VM and associated drives...

$ vagrant up
[default] Importing base box 'lucid64'...
[default] Matching MAC address for NAT networking...
[default] Clearing any previously set forwarded ports...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Booting VM...
[default] Waiting for VM to boot. This can take a few minutes.
[default] VM booted and ready for use!
[default] Mounting shared folders...
[default] -- v-root: /vagrant
{{< / highlight >}}

Si vous avez compris comment mettre à jours la box, immaginez vous faire la même chose avec l'installation de middleware (Apache, Nginx, PHP, Rails, &#8230;) :)

Prochain épisode ? Déploiment d'un environnement pour héberger du Rails ?

Vous pouvez demander si vous avez d'autres idées d'articles.

Edit:  
Je me suis posé la question d’où est-ce que je pouvais trouver des boxes toutes prêtes. Parce que bon, Ubuntu 64bits c'est bien. Mais moi j'ai aussi de la Debian :)  
J'ai trouvé http://vagrantbox.es/ et je me suis rendu compte après que @Ethernitys l'avait ajouté dans un Tweet qui concernait cet article.

 [1]: https://www.virtualbox.org/wiki/Downloads "Le téléchargement de Virtual Box"
