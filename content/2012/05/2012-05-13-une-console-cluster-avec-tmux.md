---
date: 2012-05-13
title: Une console cluster avec tmux
url: /informatique/une-console-cluster-avec-tmux/
tags:
  - Informatique
  - cluster
  - tmux
  - unix
---
Tous ceux qui ont déjà travaillé avec un cluster le savent bien. Il faut avec deux machines « strictement » identiques.

La meilleure solution est d'avoir une « console cluster ». Je n'ai jamais trouvé de solution réellement efficace et pratique à utiliser (la plus pratique celle de SUN).

Bref. En parallèle, je voulais regarder ce que [Tmux][1] avait dans le ventre pour remplacer [Screen][2] qui a fait son temps.

Et en pleine lecture de [tmux: Productive Mouse-Free Development][3], je me rends compte qu'il est surement possible d'en faire une super console pour cluster.

Fichier « .tmux-clust.conf »

{{< highlight bash >}}
new-session -d -s clust -n clust1 'ssh clust-root1'
split-window -v -t clust 'ssh clust-root2'
set -g status-right ""
source-file ~/.tmux-clust-bc.conf
{{< / highlight >}}

Fichier « .tmux-clust-bc.conf »

{{< highlight bash >}}
set-window-option synchronize-panes on
bind r source-file ~/.tmux-clust-nobc.conf \; display "Stop broadcast"
set -g status-bg green
set -g pane-active-border-fg green
unbind u
unbind i
unbind o
unbind p

bind u set-window-option synchronize-panes off \; send-keys -t clust:0.0 '1' \; send-keys -t clust:0.1 '2' \; set-window-option synchronize-panes on
bind i set-window-option synchronize-panes off \; send-keys -t clust:0.0 '2' \; send-keys -t clust:0.1 '1' \; set-window-option synchronize-panes on
bind o set-window-option synchronize-panes off \; send-keys -t clust:0.0 '192.168.21.' \; send-keys -t clust:0.1 '192.168.22.' \; set-window-option synchronize-panes on
bind p set-window-option synchronize-panes off \; send-keys -t clust:0.0 '192.168.22.' \; send-keys -t clust:0.1 '192.168.21.' \; set-window-option synchronize-panes on
{{< / highlight >}}

Fichier « .tmux-clust-nobc.conf »

{{< highlight bash >}}
set-window-option synchronize-panes off
bind r source-file ~/.tmux-clust-bc.conf \; display "Now with broadcast"
set -g status-bg blue
set -g pane-active-border-fg blue

unbind u
unbind i
unbind o
unbind p
bind u send-keys -t clust:0.0 '1' \; send-keys -t clust:0.1 '2'
bind i send-keys -t clust:0.0 '2' \; send-keys -t clust:0.1 '1'
bind o send-keys -t clust:0.0 '192.168.21.' \; send-keys -t clust:0.1 '192.168.22.'
bind p send-keys -t clust:0.0 '192.168.22.' \; send-keys -t clust:0.1 '192.168.21.'
{{< / highlight >}}

Et pour finir le fichier « tmux-clust »

{{< highlight bash >}}
#!/bin/bash
tmux -f ~/.tmux-clust.conf attach
{{< / highlight >}}

Du coup, quand je me connecte avec le script « tmux-clust », il lance une connexion vers clust-root1 et clust-root2 chacun dans un panneau. Et par défaut, on est dans le mode « bc » pour broadcast.

Les touches :

  * C-b u -> 1 -> node
  * C-b i -> 2 -> other_node
  * C-b o -> 192.168.21 -> node\_addr\_base
  * C-b p -> 192.168.22 -> other\_addr\_base
  * C-b r -> Change broadcast mode

« C-b r » permet de passer d'un « mode » à un autre :  

- Vert « broadcast » on envoie la purée sur les deux machines en même temps  
- Bleu mode normal C-b fléche pour passer de l'un à l'autre

Et voila, une console cluster en mieux :p

 [1]: http://tmux.sourceforge.net/ "Tmux - le site"
 [2]: https://www.gnu.org/software/screen/ "Screen - Le 'site'"
 [3]: http://pragprog.com/book/bhtmux/tmux "tmux: Productive Mouse-Free Development"
