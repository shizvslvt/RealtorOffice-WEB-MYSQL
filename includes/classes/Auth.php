<?php

class Auth
{
    private static $md5status = false;


    public static function login($mail, $password)
    {
        global $db, $notify;
        if (self::$md5status) $password = md5($password);
        $sql = "SELECT id, mail, password FROM ro_users WHERE mail = '$mail' AND password = '$password'";
        $result = $db->query($sql);
        if ($result) {
            if ($result->num_rows > 0) {
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
            $notify->setMessage("Error executing the query (login)");
        }
        $db->close();
    }

    public static function logout()
    {
        global $notify;
        setcookie("uid", null, time() - 3600);
        $notify->setMessage("You have logged out");
        header('Location: ?p=home');
        exit();

    }


    public function register($name, $mail, $password, $repeatpass, $birthday, $PID, $created)
    {
        global $db, $notify;

        if (empty($name) || empty($mail) || empty($password) || empty($repeatpass) || empty($birthday) || empty($PID) || empty($created)) {
            $notify->setMessage("All fields are required");
        } else {
            if ($password != $repeatpass) {
                $notify->setMessage("Passwords do not match");
            } else {
                $sql_check = "SELECT * FROM ro_users WHERE mail = '$mail' OR PID = '$PID'";
                $result = $db->query($sql_check);
                if ($result->num_rows > 0) {
                    $notify->setMessage("Mail or PID already exists");
                } else {
                    if (self::$md5status) $password = md5($password);
                    $sql = "INSERT INTO ro_users (name, mail, password, birthday, PID, created) VALUES ('$name', '$mail', '$password', '$birthday', '$PID', '$created')";
                    if ($db->query($sql) === TRUE) {
                        $notify->setMessage("Registration successful");
                        header('Location: ?p=login');
                        exit();
                    } else {
                        $notify->setMessage("Error: " . $sql . "<br>" . $db->error);
                    }
                }
            }
        }
        $db->close();
    }


    public function register_realtor($name, $mail, $password, $repeatpass, $birthday, $PID, $created, $exp)
    {
        global $db, $notify;

        if (empty($name) || empty($mail) || empty($password) || empty($repeatpass) || empty($birthday) || empty($PID) || empty($created) || empty($exp)) {
            $notify->setMessage("All fields are required");
        } else {
            if ($password != $repeatpass) {
                $notify->setMessage("Passwords do not match");
            } else {
                $sql_check = "SELECT * FROM ro_users WHERE mail = '$mail' OR PID = '$PID'";
                $result = $db->query($sql_check);
                if ($result->num_rows > 0) {
                    $notify->setMessage("Mail or PID already exists");
                } else {
                    if (self::$md5status) $password = md5($password);

                    //TODO add transaction
                    $sql = "INSERT INTO ro_users (name, mail, password, birthday, PID, created) VALUES ('$name', '$mail', '$password', '$birthday', '$PID', '$created')";
                    if ($db->query($sql) === TRUE) {
                        $user_id = $db->insert_id;
                        $sql_realtor = "INSERT INTO ro_realtors (user_id, percent, experience) VALUES ('$user_id', 10, '$exp')";
                        if ($db->query($sql_realtor) === TRUE) {
                            $notify->setMessage("Registration as realtor successful");
                            header('Location: ?p=login');
                            exit();
                        } else {
                            $notify->setMessage("Error adding realtor: " . $sql_realtor . "<br>" . $db->error);
                        }
                    } else {
                        $notify->setMessage("Error: " . $sql . "<br>" . $db->error);
                    }
                }
            }
        }
        $db->close();
    }




}
