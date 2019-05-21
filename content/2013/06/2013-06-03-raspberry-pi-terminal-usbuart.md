---
date: 2013-06-03
title: Raspberry π / Terminal USB/UART
url: /informatique/raspberry-pi-terminal-usbuart/
disqus_url: https://blog.ledez.net/informatique/raspberry-pi-terminal-usbuart/
tags:
  - Informatique
  - Tips
  - Raspberryπ
  - serial
  - usb
excerpt_separator: <!--more-->
---
{{< figure src="/images/2013/06/RaspberryPi-1024x682.jpeg" title="RaspberryPi" >}}

Si toi aussi tu as un Raspberry π. Mais que tu n'as pas de Minitel (pour savoir comment, va voir la session de [@lhuet35][2] au [Breizhcamp][3]).

Sinon l'autre solution est de lire le reste de l'article.

<!--more-->

Il ne te reste qu'à acheter un adaptateur à base de CP2102 :

{{< figure src="/images/2013/06/CP2102.jpg" title="CP2102" >}}

J'ai acheté le mien une fortune (au moins $2.67 frais de port inclus) sur [Ebay][5].

Ensuite, tu branche :

  * Le fil orange sur TX
  * Le fil rouge sur RX
  * Le fil marron sur GND

Tu prend ton Raspberry π (éteint c'est mieux). Et tu branche dans l'ordre :

{{< figure src="/images/2013/06/GPIOs.png" title="Les ports GPIO" >}}

Le marron sur le PIN 6 (Ground)

L'orange sur le PIN 8 (TXD)

Le rouge sur le PIN 10 (RXD)

Ca donne ça, et ça fonctionne :)

{{< figure src="/images/2013/06/RaspberryPi-USBSerial-1024x732.jpg" title="RaspberryPi-USBSerial" >}}

Et pour me connecter à partir de mon Mac, ça donne :

{{< highlight bash >}}
screen /dev/tty.SLAB_USBtoUART 115200
{{< / highlight >}}

 [2]: https://twitter.com/lhuet35 "Laurent Huet aka Minitel master"
 [3]: http://www.breizhcamp.org/programme/ "Va voir la session "Minitel on the cloud""
 [5]: http://www.ebay.com/sch/i.html?_nkw=CP2102 "Ebay"
