<?php
    require_once('../config.php');
    require_once('../models/model_database.php');
    $object = new DataBase(LOCALHOST, USER, PASSWORD, DATABASE);
    $json_encode = $object->selectChat();
    echo $json_encode;
    unset($object);
?>