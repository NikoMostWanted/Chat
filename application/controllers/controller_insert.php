<?php
    require_once('../config.php');
    require_once('../models/model_database.php');
    $object = new DataBase(LOCALHOST, USER, PASSWORD, DATABASE);
    session_start();
    $id_user = $_SESSION['id_user'];
    $object->insertChat($id_user, $_GET['text']);
    unset($object);
?>