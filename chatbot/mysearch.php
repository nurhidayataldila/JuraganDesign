<?php
include "../config/connection.php";
session_start();
date_default_timezone_set("Asia/Jakarta");
$server_time=date("Y-m-d H:i:s");

if(isset($_POST['text'])){
$username = $_SESSION["username"];
$msg=mysqli_real_escape_string($con,$_POST["text"]);


$query=mysqli_query($con,"SELECT * FROM question WHERE question RLIKE '[[:<:]]".$msg."[[:>:]]'");
$count = mysqli_num_rows($query);

    if($count=="0"){

        $data = "Maaf, kami tidak menemukan masalah yang anda cari. Silahkan coba kata lain";
        $query4=mysqli_query($con,"insert into chats(tag,user,chatbot,date)values('$username','$msg','$data','$server_time')");

    }else{
        while($row = mysqli_fetch_array($query)){

                $data= $row['answer'];

                $query4=mysqli_query($con,"insert into chats(tag,user,chatbot,date,tag)values('$username','$msg','$data','$server_time')");
            }
        }
}
?>
