FROM centos:latest
MAINTAINER Mark Athow (mark.athow@gmail.com)

RUN curl -s -L --output pdk.rpm \
 "https://pm.puppetlabs.com/cgi-bin/pdk_download.cgi?dist=el&rel=7&arch=x86_64&ver=latest" && \
  yum install -y pdk.rpm && \
  rm -rf pdk.rpm && \
  ln -s /opt/puppetlabs/pdk/private/git/bin/git /usr/bin/git
RUN curl "http://reflection.oss.ou.edu/gnu/emacs/emacs-25.3.tar.gz" --output emacs.tar.gz
RUN tar -zxvf emacs.tar.gz
RUN yum groupinstall -y "Development tools"
RUn yum install -y ncurses ncurses-devel
RUN cd emacs-25.3 && ./configure && make && make install
RUN cd .. && \
  rm emacs.tar.gz && \
  rm -rf emacs-25.3


