## web 钩子推送部署流程

1.gogs 收到 git push 推送命令</br> 2.触发 web 钩子向指定的 url 发送一个 post 请求</br>
3.webhook.php 收到这个 post 请求</br>
4.webhook.php 解析数据，获取你的 repo，username，repo_http_url</br>
5.webhook.php 把这三个参数传递给 deploy.sh 并执行，并生成日志写入 git-webhook.txt</br>
6.deploy.sh 收到参数后开始执行命令，进入相应的目录，推送代码到 Nginx 上

## 注意事项

1.deploy.sh 脚本要设置 sudo 权限，要判断具体是哪个用户在执行 webhook.php，本项目中的是 apache [怎么测试？](#判断哪个用户在执行-webhookphp)

2.修改 etc/sudoers 文件取获取权限，注意这个 sudoers 文件是只读的，怎么打开并保存自行百度

/etc/sudoers 文件部分内容如下：

> root ALL=(ALL:ALL) ALL
> </br>
> apache ALL=(root) NOPASSWD:ALL

添加这一行：apcher ALL=(root) NOPASSWD:ALL，意思是给 apche 用户上 root 权限</br>
然后 :wq! 强制保存</br>
**注意 sudoers 这个文件是只读的，具体怎么打开读写并保存看你的情况而定，详细内容可以自行百度解决**

### 判断哪个用户在执行-webhook.php

写一个 userinfo.php,内容如下：

```

<?php
    echo shell_exec("id -a");
?>

```

然后打开你的浏览器，输入这个 php 地址，如下图所示，说明是 apche 用户
![web](../img/web4.png)

### 更多疑问，请联系管理员 2945802136@qq.com
