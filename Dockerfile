FROM fedora:21

RUN yum update -y
RUN yum install -y virt-manager
RUN yum install -y openssh-clients
RUN yum install -y openssh-askpass

RUN useradd -m app
USER app
ENV HOME /home/app
CMD dbus-run-session /usr/bin/virt-manager --no-fork
RUN mkdir -p /home/app/.config/dconf/
RUN mkdir -p /home/app/.ssh/
VOLUME /home/app/.config/dconf/
VOLUME /home/app/.ssh/
