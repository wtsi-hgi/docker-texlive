# 
# TeX Live Dockerfile
#
# https://github.com/wtsi-hgi/docker-texlive
# 
FROM ubuntu:12.04
MAINTAINER "Joshua C. Randall" <jcrandall@alum.mit.edu>

# Install prerequisites
RUN apt-get -qqy update \
&& apt-get -qqy install build-essential wget

# Install TeXLive from CTAN
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
&& tar -xvf install-tl-unx.tar.gz \
&& cd install-tl-* \
&& echo "selected_scheme scheme-full" > texlive.profile \
&& echo "TEXDIR /usr/local/texlive/2014" >> texlive.profile \
&& ./install-tl -profile texlive.profile
ENV PATH /usr/local/texlive/2014/bin/i386:/usr/local/texlive/2014/bin/x86_64-linux:$PATH
RUN tlmgr install latexmk

