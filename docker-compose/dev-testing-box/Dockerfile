FROM debian:latest

RUN apt-get update && apt-get install -y \
  sudo \
  ssh \
  git \
  vim \
  pass \
  curl \
  gnupg \
  openssh-client \
  && apt-get clean

RUN useradd -ms /bin/bash dev && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && echo "dev:devpass" | chpasswd

USER dev

WORKDIR /home/dev
