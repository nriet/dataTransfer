# dataTransfer
数据传输工具



# 镜像说明 
# nriet/dataTransfer
* 数据传输系统
* version：7.8.1
* os：ubuntu
* other：中文语言包、中国标准时间


##数据持久化
* 配置
* /opt/dataTransfer/bin/config/
* 工作目录
* /opt/dataTransfer/bin/work/
* python脚本
* /opt/dataTransfer/bin/python/

# docker命令部署

## 1.生成配置文件
```docker
###创建容器进入命令行
docker run --user root --rm -ti \
-v /data/local/dataTransfer/config:/mnt/config \
-v /data/local/dataTransfer/python:/mnt/python \
nriet/dataTransfer:7.8.1 /bin/sh
###复制配置文件
cp -a /opt/dataTransfer/bin/config/* /mnt/config/
cp -a /opt/dataTransfer/bin/python/* /mnt/python/
exit
```

## 2.部署
```docker
docker run --restart=always --name='dataTransfer' -d \
--privileged=true --cap-add=SYS_PTRACE \
-e VNC_PW=pass \
-p 6901:6901 \
-v /data/local/dataTransfer/config:/opt/dataTransfer/bin/config \
-v /data/local/dataTransfer/python:/opt/dataTransfer/bin/python \
-v /data/local/dataTransfer/work:/opt/dataTransfer/bin/work \
nriet/dataTransfer:7.8.1
```

# 版本更新记录
    **************************7.8.1****************************************
    【事件】
        1、新增换名处理规则，增加对文件名时间的+,- Y|m|d|H|M|S，用于支持北京时和世界时互换
    【时间】2020-11-27
