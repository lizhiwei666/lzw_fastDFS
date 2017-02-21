#!/bin/sh
mkdir -p /software/fastDFS
cd /software/fastDFS
wget https://github.com/lizhiwei666/lzw_fastDFS/raw/master/libfastcommon-1.0.7.tar.gz
wget https://github.com/lizhiwei666/lzw_fastDFS/raw/master/fastdfs-5.05.tar.gz
wget https://github.com/lizhiwei666/lzw_fastDFS/raw/master/fastdfs-nginx-module_v1.16.tar.gz
wget https://github.com/lizhiwei666/lzw_fastDFS/raw/master/nginx-1.8.1.tar.gz

yum install -y libevent
tar zxvf libfastcommon-1.0.7.tar.gz
cd libfastcommon-1.0.7/
./make.sh
./make.sh install
ln -s /usr/lib64/libfastcommon.so /usr/local/lib/libfastcommon.so
ln -s /usr/lib64/libfastcommon.so /usr/lib/libfastcommon.so
ln -s /usr/lib64/libfdfsclient.so /usr/local/lib/libfdfsclient.so
ln -s /usr/lib64/libfdfsclient.so /usr/lib/libfdfsclient.so

cd /software/fastDFS
tar zxvf fastdfs-5.05.tar.gz
cd /software/fastDFS/fastdfs-5.05
./make.sh
./make.sh install

cd /software/fastDFS/
tar zxvf fastdfs-nginx-module_v1.16.tar.gz

cd /software/fastDFS/fastdfs-nginx-module/src/
mv config config_bak
wget https://raw.githubusercontent.com/lizhiwei666/lzw_fastDFS/master/softwarefastDFSfastdfs-nginx-modulesrc_config
mv softwarefastDFSfastdfs-nginx-modulesrc_config config
cd /software/fastDFS/

cp /etc/fdfs/tracker.conf.sample /etc/fdfs/tracker.conf
cp /etc/fdfs/storage.conf.sample /etc/fdfs/storage.conf
cp /etc/fdfs/client.conf.sample /etc/fdfs/client.conf
cp /software/fastDFS/fastdfs-5.05/conf/mime.types /etc/fdfs
cp /software/fastDFS/fastdfs-5.05/conf/http.conf /etc/fdfs
cp /software/fastDFS/fastdfs-nginx-module/src/mod_fastdfs.conf /etc/fdfs
mkdir -p /home/yuqing/fastdfs/fastdfs-nginx-module/data-and-log






