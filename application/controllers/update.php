<?php
require_once('../config.php');
require_once('../models/model_database.php');
$object = new DataBase(LOCALHOST, USER, PASSWORD, DATABASE);
$data = $object->selectChat();
unset($object);
for($i=0;$i<count($data);$i++) {
    echo $data[$i]['firstname'].' ';
    echo $data[$i]['lastname'].':  ';
    echo $data[$i]['text'].'  ';
    echo $data[$i]['time'].PHP_EOL;
}