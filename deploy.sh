#!/bin/bash
unset GIT_DIR
#取webhook.php传递过来的变量
UserName=$1
repo=$2
repoHttpUrl=$3

echo "==============================================="
echo "deploying the web app"

PublicPath="/var/gogs/nginx/html/"
DeployPath=$PublicPath$UserName
echo $repo
echo $DeployPath
echo $repoHttpUrl

if [[ -d "$DeployPath" ]]; then
    echo "文件夹存在"
    cd $DeployPath
    if [[ -d "$repo" ]]; then
        echo "repo存在"
        cd $repo
        sudo env -i git pull
    else
        echo "repo不存在"
        sudo git clone $repoHttpUrl
        cd $repo
        sudo env -i git pull
    fi

else
    echo "文件夹不存在"
    sudo mkdir $DeployPath 2>&1
    cd $DeployPath 2>&1
    echo $(pwd)
    sudo git clone $repoHttpUrl 2>&1
    cd $repo 2>&1
    sudo env -i git pull 2>&1
fi

time=`date`

echo "web server pull at webserver at time: $time."
echo "访问地址：http://gitku.cn:8083/"$UserName"/"$repo"/index.html"
echo "================================================"