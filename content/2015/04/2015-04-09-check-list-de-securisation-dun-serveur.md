---
date: 2015-04-09
title: Check-list de sécurisation d'un serveur
url: /informatique/check-list-de-securisation-dun-serveur/
disqus_url: https://blog.ledez.net/informatique/check-list-de-securisation-dun-serveur/
tags:
  - adminsys
  - Sécurité
  - DevOps
  - Informatique
  - Tips
excerpt_separator: <!--more-->
---
<div id="attachment_2373" style="width: 310px" class="wp-caption alignnone">
  <a href="/images/2015/04/Flat-coated_Retriever_Molly.jpg"><img class="size-medium wp-image-2373" src="/images/2015/04/Flat-coated_Retriever_Molly-300x225.jpg" alt="Pour ne pas finir à poil sur Internet" width="300" height="225" srcset="/images/2015/04/Flat-coated_Retriever_Molly-300x225.jpg 300w, /images/2015/04/Flat-coated_Retriever_Molly.jpg 800w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Pour ne pas finir à poil sur Internet
  </p>
</div>

Ce matin, mon copain Antony me demande &laquo;&nbsp;C'est quoi ta check-list pour vérifier la sécurité sur un serveur ?&nbsp;&raquo;.

Je ne m'étais jamais posé la question. Du coup, je vais la faire ici :p

<!--more-->

  * Faire un tour dans la configuration SSH 
      * Changer le port (Port) ?
      * Restreindre les utilisateurs autorisés (AllowUsers) ?
      * Utiliser une authentification par clé à la place de mots de passe
      * Fail2ban
  * Lister les ports en écoute \`lsof -i -sTCP:LISTEN\` 
      * Mettre un Firewall
      * Ou restreindre les IP en écoute (* c'est toutes les interfaces, 127.0.0.1 c'est que en local)
  * Lister les deamons sur la machine (ps faux) 
      * Enlever ce qui ne sert pas (bien être sur)
      * Vérifier les configurations type login/pass par défaut
  * Gérer les mises à jour avec un truc du &laquo;&nbsp;apticron&nbsp;&raquo; ou un plugin nagios &laquo;&nbsp;check_apt&nbsp;&raquo;
  * Installer un outil du type &laquo;&nbsp;logcheck&nbsp;&raquo;
  * Enlever les entêtes serveur (type HTTP avec version, etc.)

Et toi ?

Crédit image : [wikipédia][1] & [wikipédia aussi][2]

 [1]: http://en.wikipedia.org/wiki/Security#/media/File:Security_spikes_1.jpg
 [2]: http://commons.wikimedia.org/wiki/File:Flat-coated_Retriever_Molly.jpg
