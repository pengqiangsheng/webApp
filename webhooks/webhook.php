


<?php
header('Access-Control-Allow-Origin:*');
$path = "你的项目部署路径";
$requestBody = file_get_contents("php://input");
if (empty($requestBody)) {
    die('send fail');
}else {
    echo "发送成功！！";
}
$content = json_decode($requestBody, true);
$repo = $content['repository']['name'];
$userName = $content['repository']['owner']['username'];
$repoHttpUrl = $content['repository']['clone_url'];

$shell = "./deploy.sh ".$userName." ".$repo." ".$repoHttpUrl;
echo $shell;

$log_shell = shell_exec($shell);


echo $log_shell;

$log = "================================================";
$log .= $userName.'在'.$content['repository']['updated_at'].'推送了'.$repo.PHP_EOL;
$log .= $log_shell.PHP_EOL;
#echo $log;
$file = "git-webhook.txt";
$f = file_put_contents($file, $log, FILE_APPEND);//追加写入
if($f) {

echo "success";
}else {
echo "fail";
}
?>
