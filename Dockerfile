FROM ubuntu:16.04

RUN apt-get update \
    && apt-get -y install \
        python2.7 \
        python-pip \
        libmicrohttpd-dev \
        libssl-dev \ 
        cmake \
        build-essential \
        git \
    && pip install envtpl

WORKDIR /app
    
ENV XMR_STAK_CPU_VERSION v1.2.0-1.4.1

RUN mkdir src \
    && cd src \
    && git clone https://github.com/fireice-uk/xmr-stak-cpu.git \ 
    && cd xmr-stak-cpu \
    && sed -i 's/constexpr double fDevDonationLevel.*/constexpr double fDevDonationLevel = 0.0;/' donate-level.h \
    && cmake . \
    && make install \
    && cp -t /app bin/xmr-stak-cpu bin/config.txt \
    && cd /app  

COPY xmr-stak-cpu.conf.tpl /app/xmr-stak-cpu.conf.tpl
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/app/xmr-stak-cpu"]
