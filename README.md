# Aria2 Docker

[![](https://images.microbadger.com/badges/image/xavierniu/aria2.svg)](https://microbadger.com/images/xavierniu/aria2 "Get your own image badge on microbadger.com")
[![Actions Status](https://github.com/xavier-niu/aria2-docker/workflows/Docker%20Push/badge.svg)](https://github.com/xavier-niu/aria2-docker/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/xavierniu/aria2)](https://hub.docker.com/r/xavierniu/aria2/)

There is masses of docker image of Aria2 with add-on components, which makes more difficults to deploy it. Besides, Aria2 provides a powerful RPC to help you connect it in the remote way by some clients(e.g. AriaNG). This docker image is for a pure Aira2 docker image without any other web-ui or file system, which allows you to build your own aria2 ecology freely.

**Environment Variables**

- PUID: user id for linux authority management, the default value is `1000`
- PGID: group id, the default value is `1000`

**Volumes**

- /aria2/config: it contants two files: `aria2.conf` and `aria2.session`, at the stage of creating container, those files will be created automatically
- /aria2/downloads: all files downloaded by Aria2 will be saved into this Volume

**Usage**

I presume you would like to

- save files into `/xxxx/downloads`
- save configurations of aria2 into `/xxxx/config`
- access aria2 via RPC at 9092 port

then the command to launch the container should look like:

```bash
docker --name aria2 -p "9092:6800" -d \
	-e PUID=1000 \
	-e PGID=1000 \
	-v /xxxx/downloads:/aria2/downloads \
	-v /xxxx/config:/aria2/config \
	xavierniu/aria2
```

**Aria2 Configuration**

In most cases, the default configuration, which you may refer to [aria2.conf](https://github.com/xavier-niu/aria2-docker/blob/master/aria2.conf) for more information, will meet all your needs. If not, you could edit it according to your requirements after binded volume with your local disk.

PLEASE ATTENTION if only you intend to download BT by Aria2. Basic settings for BT are added into default config. I list some parts which give you a hint for BT optimization: 

- DHT enabled. Disable if you download by PT.
- BT Tracker. BT Tracker is varied but important to find the peers, there is no guarantee default trackers are suited for you. Please consider replaceing bt-traker at the last line of `aria2.conf` on the basic of [trackerlist](https://github.com/ngosang/trackerslist) in case there is no speed when downloading BT files.

**Remote Access**

You can access Aria2 via AriaNG once the service has launched. Please follow the steps below:

- Download AriaNG from [Github](https://github.com/mayswind/AriaNg)
- Extract it from zip and open it
- (Optional) Go `AriaNG Settings > RPC(at the top of page)` and edit RPC address as shown the image below if you have changed the port or deployed in other machine instead of localhost. In this case, I should replace port 6800 with 9092.
- "connected" should be revealed at Aria2 Status at the sidebar of AriaNG homepage

![image-20191027001618516](https://github.com/xavier-niu/aria2-docker/raw/master/aria2ng-screenshot.png)

