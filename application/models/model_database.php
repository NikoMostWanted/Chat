<?php

class DataBase
{

    private $localhost;
    private $user;
    private $password;
    private $database;

    public function __construct($localhost, $user, $password, $database)
    {
        $this->localhost = $localhost;
        $this->user = $user;
        $this->password = $password;
        $this->database = $database;
    }

    private function connectToBase()
    {
        $link = mysqli_connect($this->localhost, $this->user, $this->password) or die('Error connection');
        mysqli_select_db($link, $this->database) or die('Error database');
        return $link;
    }

    public function validUser($login, $password)
    {
        $link = $this->connectToBase();
        $query = "select id from users where login='$login' and password='$password'";
        $result = current(mysqli_fetch_assoc(mysqli_query($link, $query)));
        mysqli_close($link);
        return $result;
    }

    public function insertUser($firstName, $lastName, $login, $password)
    {
        $flag = true;
        $queryFN = "insert into firstnames values(null,'$firstName')";
        $queryLN = "insert into lastnames values(null,'$lastName')";
        $selectFN = "select id from firstnames where firstname='$firstName'";
        $selectLN = "select id from lastnames where lastname='$lastName'";
        $selectLog = "select login from users where login='$login'";

        $link = $this->connectToBase();
        $result = current(mysqli_fetch_assoc(mysqli_query($link, $selectLog)));
        if (!$result) {
            mysqli_query($link, $queryFN);
            $id_firstName = current(mysqli_fetch_assoc(mysqli_query($link, $selectFN)));
            mysqli_query($link, $queryLN);
            $id_lastName = current(mysqli_fetch_assoc(mysqli_query($link, $selectLN)));
            mysqli_query($link, "insert into users values(null,'$id_firstName','$id_lastName','$login','$password')");

            $result = $login;//maybe will correct !!!

        } else $flag = false;
        mysqli_close($link);
        $result = array($flag, $result);
        return $result;
    }

    public function insertChat($id, $text)
    {
        $link = $this->connectToBase();
        $time = strftime('%H:%M:%S');
        $query = "insert into speaking values(null,'$id','$text','$time')";
        mysqli_query($link, $query);
        mysqli_close($link);
    }

    public function selectChat()
    {
        $link = $this->connectToBase();
        $query = "select firstnames.firstname, lastnames.lastname, speaking.text, speaking.time
	                  from firstnames inner join (lastnames inner join
	                  (users inner join speaking on users.id = speaking.id_user) on
	                   lastnames.id = users.id_lastname) on firstnames.id = users.id_firstname order by speaking.id desc limit 50";
        $result = mysqli_query($link, $query);
        while ($row = mysqli_fetch_array($result)) {
            $data[] = array(
                'firstName' => $row['firstname'],
                'lastName' => $row['lastname'],
                'text' => $row['text'],
                'time' => $row['time']
            );
        }
        mysqli_close($link);
        return json_encode($data);
    }

    function __destruct()
    {
        unset($this->localhost);
        unset($this->user);
        unset($this->password);
        unset($this->database);
    }
}

?>