---
date: 2019-02-17
title: ANAVI Light Controller, Sonoff-Tasmota & Domoticz in a boat
url: /iot/anavi-light-controller-sonoff-tasmota-domoticz-in-a-boat/
tags:
  - iOT
  - ESP
  - Domoticz
excerpt_separator: <!--more-->
---

I already have a [Domoticz](https://domoticz.com/) install with [Sonoff](https://www.itead.cc/smart-home/sonoff-wifi-wireless-switch-1.html) stuff & [Tasmota firmware](https://github.com/arendst/Sonoff-Tasmota).

I manage power for:

- My [Octopi](https://octoprint.org/)
- My 3d printer

But webcam doesn't work during the night. I have an [ANAVI Light Controller](https://www.crowdsupply.com/anavi-technology/light-controller) to fix this.

I want this in Domoticz:

{{< figure src="/images/2019/02/domoticz_use.png" title="Use in Domoticz" >}}

<!--more-->

If you want the same, you can do it with this configuration:

Open “Configuration” / “Configure module” it must look like this:

{{< figure src="/images/2019/02/tasmota_config_module.png" title="Configure module" >}}

In Domoticz configure a MQTT Gateway, search on the Internet to find out how to do it.

{{< figure src="/images/2019/02/domoticz_mqtt_gateway.png" title="MQTT Gateway in Domoticz" >}}

Now click on "Create Virtual Sensors"

{{< figure src="/images/2019/02/domoticz_create_virtual_sensor.png" title="Create Virtual Sensors" >}}

Now available in devices view:

{{< figure src="/images/2019/02/domoticz_create_virtual_sensor.png" title="Create Virtual Sensors" >}}

Note the "Idx" for later and return to Tasmota configuration "Configure Domoticz" part:

{{< figure src="/images/2019/02/tasmota_config_domoticz.png" title="Configure Domoticz" >}}

Put the "Idx" from Domoticz into "Idx 1".

Now you can change state and color in Domoticz:

{{< figure src="/images/2019/02/domoticz_use.png" title="Use in Domoticz" >}}

And voilà!
