# docker_hyperion
Hyperion Ambilight server in a Docker Container

#### What does it do?:
1. It pulls the current stable ubuntu image
2. It updates/upgrades apt-get
3. It installs curl/wget
4. It runs the hyperion installation script from: https://hyperion-project.org/wiki/Installation-%C3%BCber-Kommandozeile
5. Runs the hyperiond server at startup. (config in /etc/hyperion/)

#### How to use:

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
