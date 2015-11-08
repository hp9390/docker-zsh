FROM ubuntu:wily
MAINTAINER Holger Piontek <hp9390@gmail.com>

ENV GOPATH /usr/share/go/
ENV SHELL zsh
ADD aliases.zsh /root/.zsh/aliases.zsh 
ADD configs.zsh /root/.zsh/configs.zsh
RUN chmod u+s /usr/bin/whoami
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update --fix-missing -y && apt-get update && apt-get -y upgrade \ 
      && apt-get install -y language-pack-en \
                && locale-gen en_US.UTF-8 \
                      && dpkg-reconfigure locales
RUN echo ":let g:session_autosave = 'no'" > /root/.vimrc
RUN apt-get install -y aria2
RUN apt-get install -y zsh vim curl git git-flow build-essential software-properties-common wget curl git man unzip nano tmux colord zsh emacs gnupg2 rake exuberant-ctags httpie ruby
RUN apt-get install -y pass p7zip-full sshfs supervisor monit htop lynx-cur golang-go inetutils-ping
RUN go get github.com/github/hub
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN ["/bin/bash", "-c", "yes s | sh <(curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh) -m"]
RUN ["/bin/bash", "-c", "bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -m"]
RUN ["/bin/bash", "-c", "for config_file ($HOME/.zsh/*.zsh) source $config_file"]
RUN ["/bin/bash", "-c", "npm install -g node-sass"]
RUN ["/bin/bash", "-c", "npm install -g bower"]
RUN ["/bin/bash", "-c", "npm install -g gulp"]
RUN ["/bin/bash", "-c", "npm install -g grunt"]
RUN ["/bin/bash", "-c", "npm install -g yo"]
RUN ["/bin/bash", "-c", "npm install -g coffee-script"]

WORKDIR /root/
ENTRYPOINT ["/bin/zsh"]
