FROM i386/debian
RUN sed -i 's/ main/ main contrib non-free security/g' /etc/apt/sources.list.d/* && \
    apt-get update -y && \
    apt-get install -y tigervnc-standalone-server openbox gstreamer1.0-plugins-good avahi-daemon netcat-openbsd xdotool wget wine32 pulseaudio winetricks && \
    rm -rf /var/lib/apt/lists && \
    winetricks andale && \
    winetricks arial && \
    winetricks courier && \
    winetricks georgia && \
    winetricks impact && \
    winetricks times && \
    winetricks trebuchet && \
    winetricks verdana && \
    winetricks webdings && \
    winetricks tahoma
#RUN (winetricks -q allfonts --force || true) # slow and buggy and really unreliable

RUN Xtigervnc :0 & \
    export DISPLAY=:0.0 && \
    wget https://d2j9xt6n9dg5d3.cloudfront.net/win/24780926_1c962c14fdc55b2e347aeb3c3ffc5ee6/AmazonMusicInstaller.exe && \
    (wine /AmazonMusicInstaller.exe || true) && \
    touch ~/.wine/drive_c/users/root/AppData/Local/Amazon\ Music/update.ini
COPY app/ /app/
COPY root/.config/openbox/ /root/.config/openbox/

ENV VNC_DESKTOP_NAME "Xtigervnc"
ENV VNC_GEOMETRY 1280x800
ENV RTP_TARGET 172.17.0.1
ENV RTP_PORT 40000
CMD /app/main.sh
