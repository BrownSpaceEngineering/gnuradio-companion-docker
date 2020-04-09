FROM dorowu/ubuntu-desktop-lxde-vnc:bionic

# Install GNU Radio
RUN add-apt-repository ppa:gnuradio/gnuradio-releases
RUN apt-get update
# extra gtk dependency required to solve "Namespace gtk not available" error
RUN apt-get install -y gnuradio gir1.2-gtk-3.0

# Install Desktop file for easy GNU Radio Companion access
COPY gnuradio-grc.desktop /root/Desktop/