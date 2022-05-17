<?php
    $conn = mysqli_connect("localhost","root","root","locvoiture");
    mysqli_set_charset($conn,"utf-8");
    if(!$conn)
    {
        die("Connection Failed !". mysqli_connect_error());
    }
?>