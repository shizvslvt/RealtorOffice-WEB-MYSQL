<?php

class App
{
    private static $templater;

    public static function templater()
    {
        if (!self::$templater)
        {
            include_once(INCLUDES_PATH . '/smarty/libs/Smarty.class.php');

            $templater = new Smarty();
            $templater->error_reporting   = E_ALL ^ E_NOTICE;
            $templater->use_sub_dirs      = false;
            $templater->compile_id        = "TCache";
            $templater->caching           = false;
            $templater->template_dir      = SMARTY_TEMPLATES_PATH;
            $templater->compile_dir       = SMARTY_TEMPLATES_COMPILE_PATH;


            self::$templater = $templater;
        }

        return self::$templater;
    }
}