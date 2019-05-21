---
date: 2014-05-11
title: 'Arduino "stk500_getsync(): not in sync"'
author: Nicolas Ledez
url: /diy/arduino-stk500_getsync-not-in-sync/
tags:
  - DIY
excerpt_separator: <!--more-->
---
{{< figure src="/images/2014/05/BannerArduinoStk500_getsync.jpg" title="BannerArduinoStk500_getsync" >}}

J'aime bien les Ardiuno. Mais j'ai rencontré pas mal de problèmes avec les derniers que j'ai reçus.

J'avais souvent l'erreur &laquo;&nbsp;stk500_getsync(): not in sync&nbsp;&raquo;.

Après quelques mois à chercher voici ma solution :<!--more-->

### L'énoncé

Je suis souvent tombé sur cette erreur :

{{< highlight text >}}
avrdude: Version 5.11, compiled on Sep 2 2011 at 18:52:52
Copyright (c) 2000-2005 Brian Dean, http://www.bdmicro.com/
Copyright (c) 2007-2009 Joerg Wunsch

System wide configuration file is "/Applications/Dev/Arduino.app/Contents/Resources/Java/hardware/tools/avr/etc/avrdude.conf"
User configuration file is "/Users/nico/.avrduderc"
User configuration file does not exist or is not a regular file, skipping

Using Port : /dev/tty.usbserial-A9ELLV3R
Using Programmer : arduino
Overriding Baud Rate : 57600
avrdude: Send: 0 [30] [20]
avrdude: Send: 0 [30] [20]
avrdude: Send: 0 [30] [20]
avrdude: Recv: . [00]
avrdude: stk500_getsync(): not in sync: resp=0x00

avrdude done. Thank you.
{{< / highlight >}}

J'ai cherché pendant des heures sur le Net comment résoudre ce &laquo;&nbsp;stk500_getsync(): not in sync: resp=0x00&nbsp;&raquo;.

J'ai trouvé des solutions comme mettre un condensateur de 10µF entre la patte DTR et le reset de l'Arduino.

Au final, la solution (sur mon Mac) était de réinstaller complètement les drivers. Pour info, je m'en suis rendu compte en essayant sur un Linux (ça a marché directement).

### Voici donc comment faire

#### Avec le pl2303hx

{{< highlight bash >}}
cd /System/Library/Extensions
sudo mv NoZAP-PL2303-10.9.kext ~/Desktop/
sudo mv ProlificUsbSerial.kext ~/Desktop/
cd /var/db/receipts
sudo mv com.prolific.prolificUsbserialCableDriverV151.ProlificUsbSerial.pkg.bom com.prolific.prolificUsbserialCableDriverV151.ProlificUsbSerial.pkg.plist ~/Desktop/
{{< / highlight >}}

Un petit reboot pour être sûr.

Ensuite, télécharger Mac OS X Universal Binary Driver sur la page :  
<http://prolificusa.com/portfolio/pl2303hx-rev-d-usb-to-serial-bridge-controller/>

Le fichier était le &laquo;&nbsp;md\_PL2303\_MacOSX-10\_6up\_v1\_5\_1.zip&nbsp;&raquo;.

Puis l'installer.

#### Et avec le FTDI

{{< highlight bash >}}
cd /System/Library/Extensions
sudo mv FTDIUSBSerialDriver.kext ~/Desktop/
{{< / highlight >}}

Le petit reboot de précaution.

Télécharger le driver VCP sur la page :  
<http://www.ftdichip.com/Drivers/VCP.htm>

Le fichier était le &laquo;&nbsp;FTDIUSBSerialDriver\_v2\_2_18.dmg&nbsp;&raquo;.

#### Tout en même temps

  * Faire toutes les suppressions
  * Le reboot
  * Les installations de drivers (il y en a un qui demande de rebooter à la fin et pas l'autre. Mais je ne me souviens plus lesquels)

Enjoy !
