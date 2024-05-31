# ScreamRouter Amazon Music Docker

This docker container is based on Debian and will install xtigervnc, pulseaudio, Wine, and Amazon Music.

This container will output 16-bit 48kHz PCM audio encapsulated in an RTP stream to the Docker host (172.17.0.1) and is intended to be ran on the same host [ScreamRouter](https://github.com/netham45/screamrouter) is running on.

![Screenshot of Amazon Music in ScreamRouter](/images/amazon-music.png)

## Usage

1. Clone the repo ```git clone https://github.com/netham45/screamrouter-amazon-music-docker.git```
2. On the computer running Screamrouter, build the container image ```cd screamrouter-amazon-music-docker;./build.sh```
3. Make an instance of the container ```./run.sh```

At this point ScreamRouter's Auto-Detection should pick up on the container and add it to the interface.
