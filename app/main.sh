#!/bin/bash -e
rm -rf /tmp/* || true
export PULSE_COOKIE=/var/run/pulse/.config/pulse/cookie
pulseaudio --system --disallow-exit &
sleep 2
pactl load-module module-rtp-send format=s16le channels=2 rate=44100 source=auto_null.monitor destination=172.17.0.1 port=40000 mtu=1164
export DISPLAY=:0.0
OPENBOX_ENABLED=${OPENBOX_ENABLED:-1}
cd /app
if [ "$OPENBOX_ENABLED" = "1" ]; then
    exo run &
else
    ./xtigervnc.sh &
fi
if ! [ -e /installed ]
then
    wine /AmazonMusicInstaller.exe || true
    touch ~/.wine/drive_c/users/root/AppData/Local/Amazon\ Music/update.ini
    touch /installed
    kill -9 $(ps -ef | grep -i wine | awk '{print $2}') || true
fi
wine regedit "z:\app\gdi.reg"
wine ~/.wine/drive_c/users/root/AppData/Local/Amazon\ Music/Amazon\ Music.exe || true
