FROM ubuntu:wily

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update --fix-missing -y && apt-get update && apt-get -y upgrade \ 
      && apt-get install -y language-pack-en \
                && locale-gen en_US.UTF-8 \
                      && dpkg-reconfigure locales
RUN echo ":let g:session_autosave = 'no'" > /root/.vimrc
# RUN apt-get install -y apt-fast aria2
RUN apt-get install -y zsh vim curl git git-flow build-essential software-properties-common wget curl git man unzip nano tmux colord zsh emacs gnupg2 rake exuberant-ctags httpie golang
RUN export PATH=$PATH:GOROOT=/usr/local/go:GOROOT=/usr/local/go:$GOROOT/bin:$GOPATH/bin
RUN go get github.com/github/hub
# RUN sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"
# RUN bash <(curl -L https://raw.githubusercontent.com/kepbod/ivim/master/setup.sh) -m

ENTRYPOINT ["/bin/zsh"]
