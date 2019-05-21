---
date: 2015-05-24
title: La sécurité en mode devops
url: /informatique/devops/la-securite-en-mode-devops/
disqus_url: http://blog.ledez.net/informatique/devops/la-securite-en-mode-devops/
tags:
  - Sécurité
  - Informatique
  - DevOps
excerpt_separator: <!--more-->
---
Ce week-end, je me suis fait interpeler par mon copain [@jpgaulier](https://twitter.com/jpgaulier/) :

{{< tweet 602044072757481472 >}}

Et c'est une super idée d'article :)

{{< figure src="/images/2015/05/lxfsm.jpg" title="devops sécurité" >}}

<!--more-->
Donc, je me suis dit &laquo;&nbsp;comment répondre à cette question&nbsp;&raquo;.

Sans vous refaire l'histoire de devops (Internet est là pour ça :) ), on trouve dans la littérature qui parle du sujet l'acronyme suivant :

CAMS pour Culture, Automation, Measurement and Sharing

Culture, Automatisation, Mesures et (S)Partage en français dans le texte.

<strong>Mise en situation</strong>

Je vais donc traiter le sujet sous ces 4 angles-là. Et comme je pratique tout cela chez <a href="https://twitter.com/MyCozyCloud">CozyCloud</a>, je vais vous expliquer comment nous traitons du sujet &laquo;&nbsp;chez nous&nbsp;&raquo;.

Déjà, nous sommes une startup dont vous pourrez trouver plus d'information sur le site <a href="http://cozy.io/">http://cozy.io/</a>.

Mais en gros, nous développons une solution open source de cloud personnel. Vous pouvez <a href="http://cozy.io/host/install.html">l'installer chez vous</a>, ou <a href="http://cozy.io/">nous demander une instance de bêta</a>, et à venir une instance chez l'hébergeur de votre choix.

Et j'ai été embauché chez Cozy pour automatiser ces deux derniers types d'installations.

Et ceux qui me connaissent savent que je considère la sécurité comme <strong>un</strong> des éléments du système d'informations. Et c'est le cas chez Cozy. La sécurité est un élément très important (nous stockons les données de nos clients).

Petite précision. Plus tard, quand je vais parler d’utilisateurs, ce sont les employés de Cozy.

Bref, comment ça se passe chez nous.

<strong>Culture</strong>

Pour moi, c'est là que se joue tout. En effet, nous pourrons faire tout ce que l'on veut au niveau technique. Si un utilisateur donne son mot de passe à tout le monde, c'est pour moi le plus gros trou de sécurité. Mais à un moment, il faut bien travailler. Je suis donc pour faire confiance à tout le monde.

Mais comme de grands pouvoirs impliquent de grandes responsabilités, je demande aux utilisateurs d'être vigilants par rapport aux accès.

<ul>
<li>
Il faut utiliser des vrais passphrases
</li>
<li>
Les mots de passe doivent être stockés de manière chiffrée dans des outils comme Keepass ou autre
</li>
<li>
Les clés SSH doivent avoir une passphase, et gardés privés
</li>
</ul>

Et plein d'autres bonnes pratiques dans le même style.

<strong>Automatisation</strong>

Nous utilisons des outils comme <a href="http://saltstack.com/">Saltstack</a>, <a href="http://rundeck.org/">Rundeck</a>, etc.

Pour salt, cela permet d'automatiser les mises à jour. Avec Rundeck, de donner accès à des taches d'automatisation à des utilisateurs sans leur donner accède à des machines.

Un exemple avec Rundeck, je donne la possibilité aux utilisateurs, de récupérer la liste des applications installées et leurs versions. Mais aussi de déployer une nouvelle instance et tout cela sans me le demander. Ni sans donner accès à des parties sensibles de l'infrastructure. Parce que je fais confiance, mais jusqu'à un certain point <img src="{{ site.url }}/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" />

Ensuite avec salt, cela me permet d'automatiser des audits ou des mises à jour.

Quand il y a une faille sur un produit que nous utilisons, je regarde quelles sont les versions de paquets installés dans notre parc. Puis je lance les mises à jour.

<strong>Mesures</strong>

Qu'est-ce que l'on peut bien mesurer ?

Mais surtout avec quoi ?

J'utilise <a href="http://shinken-monitoring.org/">Shinken</a> depuis quelques années. Et cela me permet de lancer des tests sur des éléments de l'infrastructure et de remonter des alertes quand quelque chose ne va pas.

Ce que je surveille sur la partie sécurité (c'est un peu le sujet du billet) :

<ul>
<li>
Disponibilité quand est-ce que le service est disponible. Mais surtout être alerté quand il ne l'est plus.
</li>
<li>
Intégrité, j'utilise souvent des mots clés dans les pages des serveurs que je surveille
</li>
<li>
Et j'ajoute aussi la surveillance des backups. Comme cela, j'ai tous mes problèmes en cours dans une seule vue
</li>
</ul>

<strong>Partage</strong>

Et bien là, j'écris des articles de blog :)

Qu'en pense tu JPG ?
