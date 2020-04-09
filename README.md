# GNU Radio Companion Docker Image
This README is a tutorial on easily using [GNU Radio Companion](https://wiki.gnuradio.org/index.php/GNURadioCompanion) on any operating system. See the Quick Start below to get started.

This repository contains the Dockerfile for creating the [Docker](https://en.wikipedia.org/wiki/Docker_%28software%29) image on which GNU Radio Companion is run. This image is derived from [docker-ubuntu-vnc-desktop](https://github.com/fcwu/docker-ubuntu-vnc-desktop), which allows you to easily use graphical programs running on the image, using either [noVNC](https://novnc.com/info.html) or conventional VNC.

See [docker-ubuntu-vnc-desktop](https://github.com/fcwu/docker-ubuntu-vnc-desktop) for more configuration options (not related to GNU Radio).

Note: this image uses GNU Radio version 3.8 on Ubuntu 18.04.

[Docker Hub Repository](https://hub.docker.com/r/brownspaceengineering/gnuradio-companion)

## Quick Start
Install Docker Desktop from [here](https://www.docker.com/products/docker-desktop). If you're on Linux, see [here](https://docs.docker.com/engine/install/).

Once you've installed Docker Desktop, run the Docker container and access the virtual desktop on port `8080`:

```
docker run -p 8080:80 brownspaceengineering/gnuradio-companion
```

The first time you run this, it may take a while to download the components of the image (it's about 750MB total). However, these will be cached and won't be downloaded when you run the command again.

Then visit http://127.0.0.1:8080 to view the virtual desktop enviornment. Launch GNU Radio Companion using the desktop icon.

## Using a VNC Viewer
If the web version (noVNC) doesn't work for you or is too slow, you can try using a VNC viewer (client) application, such as [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/). To start to the Docker container with this option enabled, forward port `5900` from the container using the following command:

```
docker run -p 5900:5900 -p 8080:80 brownspaceengineering/gnuradio-companion
```

Then, connect to 127.0.0.1 with your VNC viewer and launch GNU Radio Companion.

## Transferring Files
To be able to save files when using GNU Radio Companion (such as the `.grc` flowgraph files) and have them on your computer (not just inside the Docker container), you need to share a folder between the Docker container and your computer using this command:

```
docker run -p 5900:5900 -p 8080:80 -v /mypath:/root/workdir brownspaceengineering/gnuradio-companion
```

Make sure to replace the `/mypath` part with the *full* path on your computer to where you want to create the shared folder. For example, to make the shared folder be `workdir` on your desktop:
- **Windows:** `C:\Users\bse\Desktop\workdir\`
- **Mac:** `/Users/bse/Desktop/workdir/`
- **Linux:** `/home/bse/Desktop/workdir/`

When running the container with this command, any files you save in `/root/workdir` on the container should show up in whatever folder you specified above, and vise versa.

**Another way to transfer files** is to just copy the text of them (note this doesn't work for non-plaintext files):
- Navigate to your file in the container using the file browser (button just to the right of the 'start menu' in the bottom left)
- Double-click on it and open it using Accessories->Leafpad when prompted
- Simply copy all the text of the file over to a plain text file on your computer, and save it with the same filename it had on the Docker image, including the file extension.
