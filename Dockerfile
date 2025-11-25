FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    tigervnc-common \
    novnc \
    websockify \
    supervisor \
    dbus-x11 \
    x11-utils \
    firefox \
    openjdk-21-jdk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p ~/.vnc
RUN echo "password" | vncpasswd -f > ~/.vnc/passwd
RUN chmod 600 ~/.vnc/passwd

RUN mkdir -p /opt/startup
COPY start.sh /opt/startup/start.sh
RUN chmod +x /opt/startup/start.sh

RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

EXPOSE 5901 6080

WORKDIR /workspace

CMD ["/opt/startup/start.sh"]
