# Dockerfile untuk Debian dengan NoVNC dan sound support
FROM debian:latest

# Update dan install paket dasar
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    novnc \
    websockify \
    pulseaudio \
    pavucontrol \
    firefox-esr \
    && rm -rf /var/lib/apt/lists/*

# Setup NoVNC
RUN mkdir -p /usr/share/novnc/utils/websockify
RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

# Setup audio (PulseAudio over TCP)
RUN echo "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1/8" >> /etc/pulse/default.pa
RUN echo "exit-idle-time = -1" >> /etc/pulse/daemon.conf

# Buat user untuk X11
RUN useradd -m -s /bin/bash desktopuser
USER desktopuser
WORKDIR /home/desktopuser

# Expose port untuk NoVNC
EXPOSE 8080

# Startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
