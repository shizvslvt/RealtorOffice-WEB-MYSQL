<?php

class Auth
{

    public static function login($mail, $password) {
        global $db, $notify;

//      $password = md5($password);
        $sql = "SELECT id, mail, password FROM ro_users WHERE mail = '$mail' AND password = '$password'";
        $result = $db->query($sql);
        if($result) {
            if($result->num_rows > 0) {
                $res = $result->fetch_assoc()['id'];
                setcookie("uid", $res, time() + 3600);
                $db->close();
                $notify->setMessage("Login successful");
                header('Location: ?p=home');
                exit();
            } else {
                $notify->setMessage("Incorrect email or password");
            }
        } else {
            $notify->setMessage("Error executing the query");
        }
        $db->close();
    }

    public static function logout() {
        global $notify;
        setcookie("uid", null, time() - 3600);
            $notify->setMessage("You have logged out");
            header('Location: ?p=home');
            exit();

    }


    public function register($mail, $password, $repeatpass) {
        global $db, $notify;

        if(empty($mail) || empty($password) || empty($repeatpass)){
            $notify->setMessage("All fields are required");
        } else {
            if ($password != $repeatpass) {
                $notify->setMessage("Passwords do not match");
            } else {
                //$password = md5($password);
                $sql = "INSERT INTO ro_users (password, mail) VALUES ('$password', '$mail')";
                if($db->query($sql) === TRUE) {
                    $db->close();
                    $notify->setMessage("Registration successful");
                    header('Location: ?p=login');
                } else {
                    $notify->setMessage("Error: " . $sql . "<br>" . $db->error);
                }
            }
        }
        $db->close();
    }

}
