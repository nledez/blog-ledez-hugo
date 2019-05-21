---
date: 2014-07-07
title: DevOps, l'industrie, l'informatique et les vaches
url: /informatique/devops/devops-lindustrie-linformatique-les-vaches/
disqus_url: https://blog.ledez.net/informatique/devops/devops-lindustrie-linformatique-les-vaches/
tags:
  - DevOps
excerpt_separator: <!--more-->
---
<p class="p1">
  Je sais vous allez vous dire c'est quoi le rapport avec les vaches ?
</p>

<p class="p1">
  Laissez vous porter par l'article et vous allez tout comprendre.<!--more-->
</p>

<p class="p1">
  Pour démarrer, je vais vous parler un peu de moi.
</p>

# Mon enfance

<p class="p1">
  Je suis né en Corrèze. Oui le pays de Chirac, les pommes, la verdure. À l'époque Internet pour personne. Donc je l'ai bien vécu :) Mais comme j'habitais à la campagne, j'avais beaucoup de paysans autour de chez moi. Je me souviens que quand j'étais petit tout le village aller aider le paysan à faire &laquo;&nbsp;le foin&nbsp;&raquo;. Et en échange, dans l'année nous avions le droit d'avoir un peu de lait produit par sa vingtaine de vaches. Ces moments de moisson étaient hyper conviviaux. Mais là, ce n'est plus le sujet.
</p>

# Ma formation initiale

<p class="p1">
  Ensuite j'ai déménagé en Saône et Loire ou j'ai fait un BEP Maintenance des Systèmes Mécaniques Automatisés. En gros apprendre à faire la maintenance d'une chaine de production industrielle. Pour des clients type Potain, PSA, etc. Et sur une chaine de production, la moindre interruption de service coute extrêmement cher (plusieurs dizaines de personnes au chômage technique). J'ai donc appris à :
</p>

- Faire de la maintenance proactive (pour éviter que cela ne tombe en panne)
- Et la maintenance corrective (pour que la panne dure le moins longtemps possible)

<p class="p2">
  Mais finalement je me suis rendu compte que travailler à l'usine ce n'était pas mon truc. Je me suis aussi rendu compte que ma passion pour l'informatique me donnait certaines facilités dans le domaine. J'ai donc terminé mes études dans ce domaine. Je gérais en parallèle mon petit serveur Linux, DNS, DHCP, et ne ne sais plus quoi d'autre, mais j'ai fait mes armes sous Unix à la maison.
</p>

<p class="p2">
  Vous vous rappelez des vaches ? Et bien je vais vous en parler. Mais un peu plus tard.
</p>

# L'arrivée dans le monde tu travail

<p class="p2">
  Donc j'arrive dans le monde du travail à Rennes. Chez Equant dans le service du &laquo;&nbsp;Webhosting&nbsp;&raquo; dans le service dédié à France Telecom. Là, ça a changé :
</p>

- Linux vers Solaris
- Mysql vers Oracle
- PHP vers Java et Websphere
- Apache vers iPlanet

<p class="p2">
  Par contre, tout ça sur la même machine. Nous installions tout ça avec un joli manuel écrit dans Word, imprimé. Et moi j'aimais bien cocher au fur et à mesure ce que j'avais fait. Quand il y avait des erreurs, je les notais à la main puis reportais tout ça dans un mail au rédacteur du document. Une fois que ça marche en préproduction, je passe sur mon serveur de production. Oui vous avez bien compté :
</p>

- Un administrateur système
- 2 serveurs
- Pour un seul projet

<p class="p2">
  Voir dans certains cas, nous mutualisions un maximum.
</p>

<p class="p2">
  Les vaches
</p>

<p class="p2">
  Et mes vaches dans tout ça ? Et bien j'étais arrivé en Bretagne, la région de l'agriculture intensive (avec ses bons et ses mauvais côtés).
</p>

<p class="p2">
  Donc un agriculteur ne gère plus 20 vaches, mais 100/200. Mais comment font-ils ? L'industrialisation ! Ils ont des machines adaptées à chaque tache. Des sous traitants pour certaines parties.
</p>

<p class="p2">
  Le voilà donc le rapport avec les vaches ! Mais oui maintenant &laquo;&nbsp;dans mon garage&nbsp;&raquo; (c'est pour des associations) avec du Puppet/Chef/Ansible/Saltstack/Scripts, je gère 180 serveurs. Et au final, je passe autant de temps qu'avant à gérer ces serveurs.
</p>

# Automatisation !

<p class="p2">
  C'est donc un excellent moyen de gérer ses machines plus facilement. En effet, si un problème est remonté sur une machine, on corrige la recette/script on déploie sur des machines de tests. Et si c'est OK, on généralise sur tout le parc en quelques minutes/heures. Là ou auparavant il fallait des jours voir des mois. Idem pour MAJ de sécurités, etc.
</p>

<p class="p2">
  Là où cela risque de faire mal. C'est le changement de métier des administrateurs système. Avant il suffisait de suivre un manuel, et si cela n'était pas bon, remonter l'information au rédacteur de la doc. Bon je caricature un peu. Mais ce qu'il faut retenir c'est que tout se faisait à la main machine par machine. Et que demain, il va falloir savoir écrire ces recettes/scripts.
</p>

<p class="p2">
  Et du coup, tout ce temps qui va être libéré va pouvoir être utilisé à faire cette fameuse maintenance proactive et réduire la maintenance curative. Vous allez donc améliorer la vie de votre plate-forme :)
</p>

<p class="p2">
  Et l'automatisation est une des composantes de &laquo;&nbsp;DevOps&nbsp;&raquo;.
</p>

<p class="p1">
  Convaincu ?
</p>
