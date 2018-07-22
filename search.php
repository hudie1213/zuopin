<?php
    $keywords=$_POST['keywords'];
    $con = mysql_connect("localhost","root","root");
    mysql_query("SET NAMES UTF8");
    mysql_select_db("user", $con);
    // $result = mysql_query("select * from userlike where find_in_set('文章',likes)");
	$result = mysql_query("select * from userlike where likes like '%".$keywords."%'");
	$foodsPic=array();
    while($row=mysql_fetch_array($result)){
        $foodsPic[]=$row;
    }
    print_r(json_encode($foodsPic,JSON_UNESCAPED_UNICODE));
//     $results = array();
//     while($row = mysql_fetch_assoc($result))
//     {
//         $results[] = $row;
// 		print_r(json_encode($results,JSON_UNESCAPED_UNICODE));
//         // echo json_encode($results,JSON_UNESCAPED_UNICODE);
//     }
?>