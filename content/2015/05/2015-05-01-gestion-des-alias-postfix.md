---
date: 2015-05-01
title: Gestion des alias postfix
url: /informatique/gestion-des-alias-postfix/
disqus_url: https://blog.ledez.net/informatique/gestion-des-alias-postfix/
tags:
  - Informatique
  - alias
  - mail
  - postfix
excerpt_separator: <!--more-->
---
{{< figure src="/images/2015/05/Postfix_logo-300x159.png" title="Postfix" >}}
Aujourd'hui, j'ai reçu un joli phishing sur mon adresse vinci-autoroutes@mon-domaine. C'était un phishing pour le Crédit Agricole.

À priori, je dirais que c'est un petit leak de base de données.

Et comme j'ai tweeté :

{{< tweet 594053414209851392 >}}

J'ai eu une demande sur comment je fais pour mes adresses mails &laquo;&nbsp;bidon&nbsp;&raquo; ou même personnalisés.

Et comme ce n'est pas la première fois ni la dernière, je pense&#8230;<br /> Je me suis dit que ce serait le moment de sortir ça en open source :

<!--more-->

Avant, j'utilisais :

<a href="https://github.com/nledez/aliases-scripts">https://github.com/nledez/aliases-scripts</a>

Mais :

<ul>
<li>
Il me fallait une connexion SSH
</li>
<li>
Vraiment pas pratique en déplacement
</li>
<li>
Ou pire à la caisse du magasin quand on vous demande le mail pour la carte de fidélité
</li>
</ul>

J'ai donc écrit un truc à l'arrache :

<a href="https://github.com/nledez/aliases-php">https://github.com/nledez/aliases-php</a>

Attention, c’est surement :

<ul>
<li>
Pas adapté à votre besoin, car pas user friendly
</li>
<li>
Pas fait pour être utilisé à plusieurs
</li>
<li>
Pas toujours, pratique, par exemple pour désactiver un mail, il faut le faire en SQL
</li>
</ul>

Comme c'est en open source, vous pouvez en faire ce que vous voulez. Mais attention, c'est du je n'ai-pas-le-temps-de-le maintenir-ware :)
