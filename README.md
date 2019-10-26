# Aria2 Docker

There is masses of docker image of Aria2 with add-on components, which makes more difficults to run it. Besides, Aria2 provides a powerful RPC to help you connect it in the remote way by some clients(e.g. Aria2NG). This docker image is for a pure Aira2 docker image without any other web-ui or file system, which allows you to build your own aria2 ecology freely.

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

**Remote Access**

You can access Aria2 via Aria2NG once the services has launched. Please follow the steps below:

- Download Aria2 from [Github](https://github.com/mayswind/AriaNg)
- Extract it from zip and open it
- (Optional) Go `AriaNG Settings > RPC(at the top of page)` and edit RPC address as shown the image below if you have changed the port or deployed in other machine instead of localhost. In this case, I should replace port 6800 with 9092.
- "connected" should be revealed at Aria2 Status at the sidebar of the Aria2 homepage

![image-20191027001618516](http://res.niuxuewei.com/2019-10-26-161618.png)

