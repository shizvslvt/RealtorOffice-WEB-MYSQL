<?php

class Notify {

    public function __construct() {
        session_start();
    }

    public function setMessage($message)
    {
        $_SESSION['notify_message'] = $message;
    }
    public function getMessage() {
        if (isset($_SESSION['notify_message'])) {
            return $_SESSION['notify_message'];
        }
        return null;
    }

    public function clear()
    {
        unset($_SESSION['notify_message']);
    }

}

