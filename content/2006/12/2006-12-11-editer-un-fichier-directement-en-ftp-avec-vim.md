---
id: 44
title: Editer un fichier directement en FTP avec VIM
author: Nicolas Ledez
layout: post
date: 2006-12-11
guid: http://nicolas.ledez.free.fr/blog/?p=44/2006/12/11/editer-un-fichier-directement-en-ftp-avec-vim/
url: /informatique/tips/editer-un-fichier-directement-en-ftp-avec-vim/
categories:
  - Tips
---
{{< highlight bash >}}
vim ftp://mon_utilisateur@mon_serveur_ftp/un_repertoire/un_fichier.ext
{{< / highlight >}}

ou

{{< highlight bash >}}
vim ftp://mon_utilisateur@mon_serveur_ftp/un_fichier.ext
{{< / highlight >}}

Et pas :

{{< highlight bash >}}
vim ftp://mon_utilisateur@mon_serveur_ftp:un_repertoire/un_fichier.ext
{{< / highlight >}}

L'éditeur va demander le mot de passe FTP et c'est partit. Donc plus besoin de modifier le fichier en local pour le renvoyer en FTP&#8230;
