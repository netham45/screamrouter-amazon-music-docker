# Amazon Music Docker

This is a docker container based on https://github.com/dtinth/xtigervnc-docker .

This docker container is based on Debian and will install xtigervnc, wine, pulseaudio, winetricks from Debian's repos, download fonts for Amazon Music using winetricks, and download and install Amazon Music.

This container will output 16-bit 44.1kHz PCM audio encapsulated in an RTP stream to the Docker host (172.17.0.1) and is intended to be ran on the same computer ScreamRouter is running on.

![Screenshot of Amazon Music running in ScreamRouter](/images/amazon_music.png)

## Usage

1. Clone the repo ```git clone ....```
2. cd into the repo ```docker build . -t amazon-music-docker```
3. Make a container ```docker create amazon-music-docker```
4. Configure ScreamRouter ![Screenshot of Add Source Dialog](/images/config.png)
