FROM centos:latest
ENV VNUM 1.00

#Install EPEL
RUN yum -y install epel-release

#Bring packages up to date
RUN yum -y update

#Install basic net tools
RUN yum -y install net-tools wget

#Install C/C++/Fortran Development Tools
RUN yum -y group install "Development Tools" && yum -y install clang clang++ cmake automake vim ctags

#Install basic python development tools
RUN yum -y install python-pip python-devel && pip install --upgrade pip
RUN pip install flake8

#Install basic python libraries
RUN yum -y install postgresql-devel && pip install psycopg2

#Install Golang
RUN yum -y install go
ENV PATH $PATH:/root/workdir/go/bin
ENV GOPATH /root/workdir/go
VOLUME /root/workdir

#Pull vimrc
RUN wget https://raw.githubusercontent.com/iamthebot/docker-enterprise-development/master/.vimrc
#vim pathogen
RUN mkdir -p /root/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#vim cobalt color scheme
RUN mkdir -p /root/.vim/colors && curl -LSso /root/.vim/colors/cobalt.vim https://raw.githubusercontent.com/sfsekaran/cobalt.vim/master/colors/cobalt.vim 
#vim cobaltish color scheme
RUN mkdir -p /root/.vim/colors && curl -LSso /root/.vim/colors/cobaltish.vim https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/cobaltish.vim

#install nerdtree vim file explorer
RUN mkdir -p /root/.vim/bundle
RUN git clone https://github.com/scrooloose/nerdtree.git /root/.vim/bundle/nerdtree
#install vim airline
RUN git clone https://github.com/bling/vim-airline.git /root/.vim/bundle/vim-airline
#install vim YouCompleteMe
RUN git clone https://github.com/Valloric/YouCompleteMe.git /root/.vim/bundle/YouCompleteMe
WORKDIR /root/.vim/bundle/YouCompleteMe
RUN git submodule update --init --recursive
RUN ./install.sh --clang-completer --gocode-completer
WORKDIR /
#install vim Autoformat
RUN git clone https://github.com/Chiel92/vim-autoformat.git /root/.vim/bundle/vim-autoformat
#install vim Fugitive
RUN git clone https://github.com/tpope/vim-fugitive.git /root/.vim/bundle/vim-fugitive
#install vim gitgutter
RUN git clone https://github.com/airblade/vim-gitgutter.git /root/.vim/bundle/vim-gitgutter
#install vim-go
RUN git clone https://github.com/fatih/vim-go.git /root/.vim/bundle/vim-go
#install tagbar
RUN git clone https://github.com/majutsushi/tagbar.git /root/.vim/bundle/tagbar
RUN echo "alias ls='ls --color'" >> /root/.bashrc
