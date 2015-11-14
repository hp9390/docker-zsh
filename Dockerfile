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
RUN apt-get install --install-suggests -y aria2
RUN apt-get install --install-suggests -y zsh vim curl git git-flow build-essential software-properties-common wget curl git man unzip nano tmux colord zsh emacs gnupg2 rake exuberant-ctags httpie ruby php5 ubuntu-dev-tools
RUN apt-get install --install-suggests -y pass p7zip-full sshfs supervisor monit htop lynx-cur golang-go inetutils-ping encfs tor proxychains
RUN ["/bin/bash", "-c", "wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh"]
RUN ["/bin/bash", "-c", "http -d https://raw.githubusercontent.com/haad/proxychains/master/src/proxychains.conf"]
RUN ["/bin/bash", "-c", "cp proxychains.conf /etc/proxychains.conf"]
RUN ["/bin/bash", "-c", "add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make"]
RUN ["/bin/bash", "-c", "apt-get update"]
RUN ["/bin/bash", "-c", "apt-get install --install-suggests -y ubuntu-make mutt"]
RUN ["/bin/bash", "-c", "curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer"]
RUN ["/bin/bash", "-c", "curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony"]
RUN ["/bin/bash", "-c", "composer global require 'laravel/installer=~1.1'"]
RUN ["/bin/bash", "-c", "chmod a+x /usr/local/bin/symfony"]
RUN go get github.com/github/hub
RUN ["/bin/bash", "-c", "curl -sL https://deb.nodesource.com/setup_5.x | bash -"]
RUN apt-get install -y --install-suggests nodejs
RUN ["/bin/bash", "-c", "curl -O https://bootstrap.pypa.io/get-pip.py"]
RUN ["/bin/bash", "-c", "python get-pip.py"]
RUN ["/bin/bash", "-c", "pip install awscli"]
RUN ["/bin/bash", "-c", "yes s | sh <(curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh) -m"]
RUN ["/bin/bash", "-c", "bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -m"]
RUN ["/bin/bash", "-c", "echo 'for config_file ($HOME/.zsh/*.zsh) source $config_file' >> /root/.zshrc"]
RUN ["/bin/bash", "-c", "npm install -g node-sass"]
RUN ["/bin/bash", "-c", "npm install -g bower"]
RUN ["/bin/bash", "-c", "npm install -g gulp"]
RUN ["/bin/bash", "-c", "npm install -g grunt"]
RUN ["/bin/bash", "-c", "npm install -g yo"]
RUN ["/bin/bash", "-c", "npm install -g coffee-script"]

WORKDIR /root/
ENTRYPOINT ["/bin/zsh"]
