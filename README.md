# ScreamRouter Amazon Music Docker

This docker container is based on Debian and will install xtigervnc, pulseaudio, Wine, and Amazon Music.

This container will output 16-bit 48kHz PCM audio encapsulated in an RTP stream to the Docker host (172.17.0.1) and is intended to be ran on the same host [ScreamRouter](https://github.com/netham45/screamrouter) is running on.

![Screenshot of Amazon Music in ScreamRouter](/images/amazon_music.png)

## Usage

1. Clone the repo ```git clone https://github.com/netham45/screamrouter-amazon-music-docker.git```
2. On the computer running Screamrouter, build the container image ```cd screamrouter-amazon-music-docker;./build.sh```
3. Make an instance of the container ```./run.sh```

At this point ScreamRouter's Auto-Detection should pick up on the container and add it to the interface.

VNC listens on port 5900

There is a script listening on port 9999 for incoming UDP packets.

Sending a packet containing 'n' will send XF86AudioNext

Sending a packet containing 'p' will send XF86AudioPrev

Sending a packet containing 'P' will send XF86AudioPlay
