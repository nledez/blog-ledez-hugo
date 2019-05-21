---
date: 2010-01-13
title: Edit a file with vim over ssh
url: /informatique/edit-a-file-with-vim-over-ssh/
tags:
  - Informatique
  - Tips
  - Ssh
  - Vim
---

Next step of [Edit a file with vim over FTP](/informatique/tips/editer-un-fichier-directement-en-ftp-avec-vim/)

I would like to edit /etc/init.d/squid on bozzo host:

{{< highlight bash >}}
vim scp://bozzo//etc/init.d/squid
{{< / highlight >}}

If you try with:

{{< highlight bash >}}
vim scp://bozzo/etc/init.d/squid
{{< / highlight >}}

vim edit the file &laquo;&nbsp;etc/init.d/squid&nbsp;&raquo; in user home directory (/root/etc/squid/squid.conf in normal root account)

