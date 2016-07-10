#测试镜像命令
FROM ubuntu:14.04
MAINTAINER Jarvis "562502332@qq.com"
ENV MK_DATE=20160710

#LABEL  镜像元数据
LABEL version="1.0" type="ubuntu" tags="14.04" role="test"
#update sources.list

RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update && apt-get -yqq install nginx

#RUN指构建时执行的命令

#设置命令执行空间
WORKDIR /usr/local/text_dir

RUN touch 123.text

#设置环境变量，并将环境变量写入 123.txt
RUN echo $VERSION >> 123.text

USER nginx

RUN echo who >> 123.text

#挂在宿主机opt目录
VOLUME ["/opt"]

#ADD 将构建环境下的文件和目录复制到镜像中  源文件路径支持url格式 添加归档文件（非url）可以自动解压到文件夹下，不会覆盖文件。
#如果路径不存在，会自动创建，但后续命令不能使用之前的构建缓存
ADD add.txt /opt/text/add.txt
ADD ["add.txt","/opt/text/add1.txt"]
ADD ../gradle/build.gradle /opt/text/build.gradle

#COPY 与ADD类似，但只复制文件并不做提取解压等操作。  路径不存在也会自动创建

#CMD指程序启动时运行的命令 配置文件中CMD命令只能有一条 多条会选择最后一条执行
CMD ["/bin/bash","-l"]


#STOPSIGNAL 用来设置停止容器时发送什么系统调用信号给容器

#ARG 定义可以在docker build 命令运行时传递给构建运行时的变量

#ONBUILD 为镜像添加触发器 用于在构建时执行脚本
EXPOSE 80

debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
invoke-rc.d: policy-rc.d denied execution of start.

