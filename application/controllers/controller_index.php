<?php
    require_once('../models/model_database.php');
    require_once('../config.php');
    $object = new DataBase(LOCALHOST, USER, PASSWORD, DATABASE);
    switch($_POST['submit'])
    {
        case 'Authorization':
            $result = $object->validUser($_POST['login'],md5($_POST['password']));
            if($result) {
                unset($object);
                session_start();
                $_SESSION['id_user']=$result;
                require_once('../views/success_authorization_view.htm');
            } else {
                unset($object);
                require_once('../views/fail_authorization_view.htm');
            }
            break;
        case 'Registration':
            list($flag,$id_user) = $object->insertUser($_POST['firstName'], $_POST['lastName'], $_POST['login'], md5($_POST['password']));
            if ($flag) {
                unset($object);
                session_start();
                $_SESSION['id_user']=$id_user;
                require_once('../views/success_registration_view.htm');
            } else {
                unset($object);
                require_once('../views/fail_registration_view.htm');
            }
            break;
        default:
            require_once('../views/index_view.htm');
    }
?>