<?php
text();
function text()
{
    $code = $_POST['code'];//小程序传来的code值
    $nick = $_POST['nick'];//小程序传来的用户昵称
    $imgUrl = $_POST['avaurl'];//小程序传来的用户头像地址
    $sex = $_POST['sex'];//小程序传来的用户性别
    $url = 'https://api.weixin.qq.com/sns/jscode2session?appid=wx65478b0c36b29502&secret=18df9c86032472d7290f648d9e170ede&js_code=' . $code . '&grant_type=authorization_code';
    $info = file_get_contents($url);//发送HTTPs请求并获取返回的数据，推荐使用curl
    $json = json_decode($info);//对json数据解码
    $arr = get_object_vars($json);
    $openid = $arr['openid'];
    $session_key = $arr['session_key'];
    $con = mysqli_connect('localhost', 'root', 'root');//连接数据库
    if ($con) {
		
        if (mysqli_select_db($con, 'user')) {
            $sql1 = "select * from userinfo where openid = '$openid'";
            $result = mysqli_query($con, $sql1);
            $result = mysqli_fetch_assoc($result);
            if ($result!=null) {//如果数据库中存在此用户的信息，则不需要重新获取
                $result = json_encode($result);
                echo $result;
            }
            else {//没有则将数据存入数据库
                if ($sex == '0') {
                    $sex = 'none';
                } else {
                    $sex = '1' ? 'man' : 'women';
                }
                $sql = "insert into userInfo values ('$nick','$openid','$session_key','$imgUrl','$sex')";
                if (mysqli_query($con, $sql)) {
                    $arr['nick'] = $nick;
                    $arr['imgUrl'] = $imgUrl;
                    $arr['sex'] = $sex;
                    $arr = json_encode($arr);
                    // echo $arr;
                } else {
                    die('failed' . mysqli_error($con));
                }
            }
        }
    } 
	else {
        die(mysqli_error());
    }
}
 
?>