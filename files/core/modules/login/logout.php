<?php
session_name("rolpel");
session_cache_expire(15800);
session_start();
session_destroy();
//Unset Cookies
setcookie("rolpel", "", 0 ,"/");
setcookie("user_id", "", 0 ,"/");
setcookie("profile_id", "", 0 ,"/");
setcookie("first_name", "", 0 ,"/");
setcookie("last_name", "", 0 ,"/");
setcookie("user", "", 0 ,"/");
setcookie("password", "", 0 ,"/");
die();
?>