FROM centos:latest
ENV VNUM 1.00

#Install EPEL
RUN yum -y install epel-release

#Bring packages up to date
RUN yum -y update

#Install basic net tools
RUN yum -y install net-tools wget

#Install C/C++/Fortran Development Tools
RUN yum -y --skip-broken group install "Development Tools" && yum -y install clang clang++ cmake automake pkgconfig

#Install basic python development tools
RUN yum -y install python-pip python34 python34-devel python-devel postgresql-devel && pip install --upgrade pip && curl https://bootstrap.pypa.io/get-pip.py | python3.4
RUN pip install flake8 psycopg2 && pip3 install neovim

#Install Golang and gocode
RUN yum -y install go
ENV PATH $PATH:/root/workdir/go/bin
ENV GOPATH /root/workdir/go
VOLUME /root/workdir
RUN go get -v github.com/nsf/gocode

#Install universal-ctags
RUN mkdir -p /root/build && git clone https://github.com/universal-ctags/ctags.git /root/build/ctags && cd /root/build/ctags && ./autogen.sh && ./configure && make && make install && cd /root/build && rm -rf /root/build/ctags

#Install Neovim
RUN git clone https://github.com/neovim/neovim.git /root/build/neovim && cd /root/build/neovim && make clean && make CMAKE_BUILD_TYPE=Release && make install && cd && rm -rf /root/build/neovim && rm -rf /root/build/ && nvim +PlugInstall +UpdateRemotePlugins +qall

#Move dotfile
ADD init.vim ~/.config/nvim/init.vim

RUN echo "alias ls='ls --color'" >> /root/.bashrc && echo 'export TERM=xterm-256color' >> /root/.bashrc && echo "alias vim='nvim'" >> /root/.bashrc
