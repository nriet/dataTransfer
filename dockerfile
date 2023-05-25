FROM accetto/xubuntu-vnc-novnc-chrome
USER root

# ENV HOME /root
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install

ENV TIME_ZONE Asia/Shanghai
 
#WORKDIR $HOME

######### Customize Container Here ###########
#设置时区
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y tzdata \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get clean \
    && rm -rf /tmp/* /var/cache/* /usr/share/doc/* /usr/share/man/* /var/lib/apt/lists/*

#设置中文字体
# COPY ./fonts /usr/share/fonts/myfonts
RUN wget -q http://bt.nriet.xyz/down/CRzeSpBo3Pok.gz -O /usr/share/fonts/myfonts.tar.gz \
    && cd /usr/share/fonts \
    && tar zxvf myfonts.tar.gz  \
    && chmod -R 755 /usr/share/fonts/myfonts \
    && cd /usr/share/fonts/myfonts \
    && mkfontscale \
    && mkfontdir \
    && fc-cache -fv \
    && rm -rf /usr/share/fonts/myfonts.tar.gz

# Install dataTransfer
COPY ./src/ubuntu/install/dataTransfer $INST_SCRIPTS/dataTransfer/
RUN bash $INST_SCRIPTS/dataTransfer/install_dataTransfer.sh
######### End Customizations ###########
