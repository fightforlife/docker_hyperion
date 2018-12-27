# docker_hyperion
Hyperion Ambilight server in a Docker Container

#### Open Problems:
This image is not working with the docker bridge mode. It always disconnects from kodi.
If you use --network host without the Port formwarding it works.
I need to check on this!!


#### What is it for?:
I like to have most of my services in their own docker containers. As I could not find a fitting container I startet building one myself. This is the first image i have ever done.
The goal is to provide a standalone service for the hyperion ambilight. This way I can have multiple picture sources (Kodi instances) running on different computers and cann still use the same Ambilight.
So far it simply works. (I only tried it with Kodi)

My setup consists of:
- 50RGB LED Strip WS2811
- Arduino Nano (with Adalight script, see .ino file)
- MediaPC/Homeserver running Kodi with Hyperion Addon

SignalFlow:
Kodi (Addon) --> Hyperion Server (in Docker) --> Arduino on (/dev/ttyUSB1) --> LEDs


#### What does it do?:
1. It pulls the current stable ubuntu image
2. It updates/upgrades apt-get
3. It installs curl/wget
4. It runs the hyperion installation script from: https://hyperion-project.org/wiki/Installation-%C3%BCber-Kommandozeile
5. Runs the hyperiond server at startup. (config in /etc/hyperion/)

#### How to use:

working way (host network!)
```
docker run -d \
  --name="Hyperion" \
  -v /etc/hyperion:/etc/hyperion:ro \
  --device=/dev/ttyUSB1:/dev/ttyUSB1 
  --network host
  fred92/hyperion:latest
```
Correct way, notfully working (random disconnects)
```
docker run -d \
  --name="Hyperion" \
  -v /etc/hyperion:/etc/hyperion:ro \
  -p 19444:19444 \
  -p 19445:19445 \
  --device=/dev/ttyUSB1:/dev/ttyUSB1 
  fred92/hyperion:latest
```

#### Instructions:

- Generate your own Hyperion Config using the HyperCon Tool: https://hyperion-project.org/wiki/HyperCon-Informationen
- Put the generated `hyperion.config.json` file in /etc/hyperion (or change the bind)



#### Changelog: 
- 2018-12-27 - Started this repo
