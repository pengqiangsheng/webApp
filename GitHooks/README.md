### git 钩子推送部署流程
- 1.每一个git仓库里都有一个文件夹.git，进去之后，里面有个hoos文件夹，git钩子就是放在这个位置的，git钩子类型有很多种，我这里只讲解一个最简单的常用的，post-receive。
- 2.post-receive钩子的意思就是当你push后，远程仓库收到了push后的代码，然后执行这个钩子的内容。
- 3.基于这个原理，我们可以编写shell脚本内容在这个钩子里面
- 4.我的项目部署路径是/nginx/html，所以我只需要`cd /nginx/html`然后`git clone http://gitku.cn:8089/pqs/web.git`
- 5.执行完`git clone`命令后，会在当前目录下(/nginx/html/)生成web文件夹，然后你安装你的目录文件去访问index.html就行了
- 6.例如，我就可以通过http://gitku.cn:8083/pqs/web/index.html 去访问了，因为我的index.html放在web文件夹的根目录。
- 7.原理就是这样的，基于这个原理我们可以扩展出更多的应用来。


#### 更多疑问，请联系管理员 2945802136@qq.com
