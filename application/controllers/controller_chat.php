<?php
    require_once('../views/chat_view.htm');
    if(@$_POST['end']) {
        session_start();
        session_encode();
        session_destroy();
        header("Location: controller_index.php");
        exit;
    }
?>