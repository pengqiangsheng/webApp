### etc/sudoers 文件修改内容

修改 etc/sudoers 文件取获取权限，注意这个 sudoers 文件是只读的，怎么打开并保存自行百度

/etc/sudoers 文件部分内容如下：

> root ALL=(ALL:ALL) ALL
> </br>
> apache ALL=(root) NOPASSWD:ALL

添加这一行：apcher ALL=(root) NOPASSWD:ALL，意思是给 apche 用户上 root 权限</br>
然后 :wq! 强制保存</br>
**注意 sudoers 这个文件是只读的，具体怎么打开读写并保存看你的情况而定，详细内容可以自行百度解决**



#### 更多疑问，请联系管理员 2945802136@qq.com
