---
date: 2010-01-13
title: Delete line in vi
url: /divers/delete-line-in-vi/
tags:
  - Divers
  - Tips
  - Vim
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
