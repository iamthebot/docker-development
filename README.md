# docker-development
Docker development image based on CentOS7 with a feature-rich neovim configuration.

## Motivation
By using CentOS7 as the base image, you can either build software against the stable installed sources or work with bleeding-edge sources by manually installing them under the /usr/local prefix.

This development image pulls the latest neovim and includes the vim-plug package manager so that you consistently have a cutting-edge development environment. Support packages for python, golang, C/C++ are installed along with the deocomplete completer.
