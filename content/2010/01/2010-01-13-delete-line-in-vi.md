---
id: 134
title: Delete line in vi
date: 2010-01-13
author: Nicolas Ledez
layout: post
guid: http://blog.ledez.net/?p=134
url: /divers/delete-line-in-vi/
categories:
  - Divers
  - Tips
tags:
  - tips
  - vim
---
To delete line in vi(m) if line respect a pattern :

{{< highlight viml >}}
:g/^#/ d
{{< / highlight >}}

Is delete comment lines

{{< highlight viml >}}
:g/^$/ d
{{< / highlight >}}

Is delete empty lines
