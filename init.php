<?php



// ---------------------------------------------------
//  Directories
// ---------------------------------------------------

define('ROOT', dirname(__FILE__) . "/");
define('INCLUDES_PATH', ROOT . '/includes');
define('USER_DATA', ROOT . "/data");
define('PAGES_PATH', ROOT . '/pages');
define('SMARTY_TEMPLATES_PATH', ROOT . '/templates');
define('SMARTY_TEMPLATES_COMPILE_PATH', ROOT . '/templates_c');

require_once USER_DATA . '/db.php';


// ---------------------------------------------------
//  Error
// ---------------------------------------------------
require_once INCLUDES_PATH . '/error_handler.php';



// ---------------------------------------------------
// Setup our classes
// ---------------------------------------------------
global $theme, $auth, $notify;

require_once INCLUDES_PATH . '/classes/App.php';
require_once INCLUDES_PATH . '/classes/Auth.php';
require_once INCLUDES_PATH . '/classes/Notify.php';
require_once INCLUDES_PATH . '/classes/Estate.php';
require_once INCLUDES_PATH . '/classes/User.php';
require_once INCLUDES_PATH . '/classes/Chat.php';
require_once INCLUDES_PATH . '/classes/Logs.php';

$theme =App::templater();
$auth = new Auth();
$notify = new Notify();
$estate = new Estate();
$user = new User();
$chat = new Chat();
$log = new Logs();


//
// Other
//

$GLOBALS["admin_id"] = 8;