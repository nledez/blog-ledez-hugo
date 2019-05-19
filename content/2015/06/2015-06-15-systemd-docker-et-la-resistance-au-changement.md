---
id: 2412
title: Systemd, Docker et la résistance au changement
date: 2015-06-15
author: Nicolas Ledez
layout: post
disqus_url: http://blog.ledez.net/?p=2412
url: /informatique/systemd-docker-et-la-resistance-au-changement/
categories:
  - Informatique
  - OpenSource
tags:
  - docker
  - systemd
excerpt_separator: <!--more-->
---
![Systemd avenir]({{ site.url }}/images/2015/06/systemd-avenir-300x229.jpg)

Comme tout bon sysadmin barbu, bourru et qui tourne à la caféine en intraveineuse, je n'aime pas le changement dans mes habitudes de travail.

Par contre, j'aime la ligne de commande. Les fichiers texte à plat. Les choses simples en sommes. Comme je le dis souvent &laquo;&nbsp;Si on fait simple. On prend le risque que cela marche&nbsp;&raquo;.

Et bien, parlons de systemd !  

<!--more-->

## Systemd

Si tu ne connais pas systemd, c'est ce qui va remplacer petit à petit les scripts init et upstart en tout genre.

Ce que les détracteurs du système on sortis comme arguments :

  * systemd est incompatible avec les scripts shell
  * systemd est difficile
  * systemd n'est pas modulaire
  * systemd utilise de fichier de configuration binaire
  * &#8230;

La liste complète en VO ici : [http://0pointer.net/blog/projects/the-biggest-myths.html.][2]

Pendant un moment, j'ai fait partie de ceux qui ont trainé des pieds. Et puis c'est arrivé dans Debian Jessie. Il fallait donc sauter dans le grand bain.

Et comme j'aime avoir mal (je prends une douche froide avant d'aller dans le grand bain à la piscine aussi). Et bien pourquoi ne pas faire un package Debian pour Jessie ?

J'ai &laquo;&nbsp;choisi&nbsp;&raquo; CouchDB pour commencer.

Le fichier de configuration ressemble à quoi ? Et bien tout simplement :

{% highlight config %}
[Unit]
Description=Couchdb service
After=network.target

[Service]
User=couchdb
PermissionsStartOnly=true
ExecStartPre=-/bin/mkdir -p /var/run/couchdb
ExecStartPre=/bin/chown -R couchdb:couchdb /var/run/couchdb
ExecStart=/usr/bin/couchdb -o /dev/stdout -e /dev/stderr
Restart=always
{% endhighlight %}


Comme tu peux le constater, c'est loin d'être du binaire. Simple à lire et comprendre. Et je ne sais pas pour toi, mais moi perso je n'ai jamais aimé écrire les script init. C'est toujours la galère <img src="{{ site.url }}/images/smilies/frownie.png" alt=":(" class="wp-smiley" style="height: 1em; max-height: 1em;" />

Alors que pour écrire celui-là, j'y ai pris du plaisir (j’en entends dire d’ici que j’aime avoir mal &#8211; c’est surement vrai ^^).

Et en bonus :

  * Le programme n'est pas obligé d'être un deamon pour tourner en tache de fond
  * Quand il tombe, il redémarre tout seul
  * Le programme peut tourner avec un user dédié facilement (fini les su avec des options à la \***)
  * On peut lancer des actions avant le serveur. Et en tant que root

Bref, j'en suis même à regretter que systemd ne soit pas dans mes autres distribs&#8230;

## Docker

[<img class="alignnone size-medium wp-image-2417" src="{{ site.url }}/images/2015/06/docker-en-prod-300x290.jpg" alt="Docker en prod" width="300" height="290" srcset="{{ site.url }}/images/2015/06/docker-en-prod-300x290.jpg 300w, {{ site.url }}/images/2015/06/docker-en-prod.jpg 400w" sizes="(max-width: 300px) 100vw, 300px" />][3]

Et maintenant Docker. C'est un peu la même chose. J'aime beaucoup le projet. Il promet des choses très intéressantes pour le futur de notre métier.

Personnellement, ce n'est pas le changement de paradigme VM/Container/App qui me dérange.

C'est la stabilité, l'exploitabilité et de maintenance de ce truc-là.

Je regarde donc de très prés ce qui se passe avec Docker. Mais je ne vais pas le mettre en prod demain.

## Résistance au changement

Tout ça pour en venir à la résistance au changement. Nous les sysadmin bouru, nous aimons la stabilité.

Donc il ne faut pas trop que cela change. Je me connecte dans ma VM en SSH. Je fais un ps pour voir tous mes process. Mais si je passe à Docker, tout ça va être chamboulé. Et moi en tant que sysadmin, je n'aime pas ça du tout !

Mais comme hier avec me script init, je scriptais, puis : `/etc/init.d/couchdb [stop|start|status]`

Maintenant, c'est &laquo;&nbsp;`vi /etc/systemd/system/couchdb.service ; systemctl daemon-reload ; systemctl [stop|start|status] couchdb`&nbsp;&raquo;

Ça m'a pris un peu de temps pour comprendre comment tout cela marchait. Mais maintenant, je suis plus à l'aise avec le nouveau système. Et je n'ai vraiment pas envie de revenir en arrière.

Et ce sera la même chose avec Docker pour un autre système de container. Puisque le vrai enjeu est là.

## Vivre avec son temps

Arrête de regarder en arrière. Regarde de l'avant. Tu apprendras beaucoup de chose. Serras toujours à la pointe. Sortiras de ta zone de confort. Tu n'en sera que gagnant.

Bref, vis avec ton temps !

 [2]: http://0pointer.net/blog/projects/the-biggest-myths.html
 [3]: {{ site.url }}/images/2015/06/docker-en-prod.jpg
