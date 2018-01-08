FROM navicore/naviron-other

MAINTAINER Ed Sweeney <ed@onextent.com>

WORKDIR /root

# Gambit-C
RUN git clone https://github.com/gambit/gambit.git \
  && cd gambit \
  && ./configure \
  && make -j"$(nproc --all)" current-gsc-boot \
  && ./configure --prefix=/opt/gambit --enable-single-host --enable-c-opt --enable-gcc-opts --enable-multiple-versions --enable-openssl --enable-default-runtime-options=f8,-8,t8 --enable-poll \
  && make -j"$(nproc --all)" from-scratch \
  && make check \
  && make install \
  && ln -s /opt/gambit/v4.8.8/bin/gsc /usr/local/bin/gsc \
  && ln -s /opt/gambit/v4.8.8/bin/gsi /usr/local/bin/gsi \
  && ln -s /opt/gambit/v4.8.8/bin/gambcomp-C /usr/local/bin/gambcomp-C \
  && ln -s /opt/gambit/v4.8.8/bin/gambdoc /usr/local/bin/gambdoc \
  && cd .. && rm -rf gambit

