#!/bin/bash

cd /tmp
wget -q -O dataTransfer.tar.gz "http://data.nriet.xyz/DataTransfer_7.9.3_kylin10_binary.tar.gz"
mkdir /opt/dataTransfer
tar -xzf dataTransfer.tar.gz -C /opt/dataTransfer
chmod u+x /opt/dataTransfer/bin/protect.sh
rm -rf /tmp/*
#ECLIPSE_ICON="/opt/dataTransfer/plugins/$(ls /opt/dataTransfer/plugins/ | grep -m 1 org.dataTransfer.platform_)/dataTransfer.png"
#sed -i "s#dataTransfer.png#${ECLIPSE_ICON}#" $INST_SCRIPTS/dataTransfer/dataTransfer.desktop
cp $INST_SCRIPTS/dataTransfer/dataTransfer.desktop $HOME/Desktop/
cp $INST_SCRIPTS/dataTransfer/dataTransfer.desktop /usr/share/applications/
