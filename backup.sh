#!/bin/bash
#
#マイクラのバックアップ自動作成スクリプト

#######ゲーム中の人のためにメッセージを送ります。#######
time1=60 #この数字をいじることで再起動までの時間を調整可能
screen -S minecraft -X stuff 'say §a§l§n自動アナウンス'`echo -ne '\015'`
screen -S minecraft -X stuff 'say §b'$time1'§秒後に§lバックアップ§6及び§l再起動§6を行います。'`echo -ne '\015'`
time2=`expr $time1 - 10`
sleep `expr $time2`
screen -S minecraft -X stuff 'say §cまもなくサーバーが自動停止します。'`echo -ne '\015'`
sleep 10
screen -S minecraft -X stuff 'stop'`echo -ne '\015'` #minecraft終了

########## minecarftが完全に終了するまで待機 ##########
#javaのプロセス数を数えてるため
#ほかにjavaを動かしていたら調整してください
count1=`ps -ef | grep java | grep -v grep | wc -l`
while :
do
    if [ $count1 = 0 ] ; then
        break
    else
        sleep 0.5
        count1=`ps -ef | grep java | grep -v grep | wc -l`
    fi
done


############## バックアップ開始 #################
#ワールドディレクトリのコピー
cp マイクラのパス/world バックアップディレクトリのパス/backup

#zipに圧縮
zip バックアップディレクトリのパス/backup/world バックアップディレクトリのパス/backup

#ファイル名に日付を付ける
cp -aiv バックアップディレクトリのパス/backup/world.zip バックアップディレクトリのパス/backup/world.`date "+%Y%m%d_%H%M"`.zip

#いらないものを消す
rm -rf バックアップディレクトリのパス/backup/world
rm バックアップディレクトリのパス/backup/world.zip

############# minecraft再起動 ##############
screen -S minecraft -X stuff 'java -Xmx4096M -Xms1024M -jar  サーバーjarの絶対パス(例/home/User/Minecraft/server.jar) nogui'`echo -ne '\015'`
#javaの引数は任意
