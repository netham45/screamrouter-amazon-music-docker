#!/bin/bash -e
rm -rf /tmp/* /tmp/.X* /run/dbus/pid /run/avahi-daemon/pid || true
export PULSE_COOKIE=/var/run/pulse/.config/pulse/cookie
dbus-daemon --system
avahi-daemon -D
pulseaudio --system --disallow-exit --use-pid-file=false -D
pactl load-module module-rtp-send format=s16le channels=2 rate=48000 source=auto_null.monitor destination=$RTP_TARGET port=$RTP_PORT mtu=1164
Xtigervnc -desktop "$VNC_DESKTOP_NAME" -geometry "$VNC_GEOMETRY" -listen tcp -ac -SecurityTypes None -AlwaysShared -AcceptKeyEvents -AcceptPointerEvents -SendCutText -AcceptCutText :0 &
sleep 2
export DISPLAY=:0.0
openbox &
/app/media_keys.sh &

winetricks ddr=gdi
while x=x
do
    wine ~/.wine/drive_c/users/root/AppData/Local/Amazon\ Music/Amazon\ Music.exe || true
    sleep 1
done
