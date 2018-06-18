<?php
	/****************************************\
	|            SYSTEM CONFIG               |
	\****************************************/
	include_once("../../../config.php");

	/****************************************\
	|            	SET SESSION                |
	\****************************************/
	session_name($SESSION_CONFIG['name']);
	session_cache_expire($SESSION_CONFIG['time']);
	session_start();

	/****************************************\
	|            	DB CONNECTION              |
	\****************************************/
	include_once("../../../core/resources/classes/class.core.data.base.php");
	$GLOBALS['DB'] = new CoreDataBase();
	if(!$GLOBALS['DB']->Connect($DB_CONFIG))
	{
		header("Location: ../../../core/resources/includes/inc.core.error.php?error=".$GLOBALS['DB']->Error);
		die();
	}

	/****************************************\
	|            LOADING CLASSES             |
	\****************************************/
	include_once("../../../core/resources/classes/class.core.php");
	spl_autoload_register("Core::Autoload");

	/****************************************\
	|           SECURITY CHECKS              |
	\****************************************/
	$Security		= new CoreSecurity();
	if($Security->CheckProfile())
	{
		$CoreUser 	= new CoreUser($_SESSION[CoreUser::TABLE_ID]);
		$Cookies 	= new CoreLogin();
		$Cookies	->SetData($CoreUser->Data['user']);
		$Cookies	->SetCookies();
		$CoreUser->GetOrganization();
	}

	/****************************************\
	|            ADDING SLASHES              |
	\****************************************/
	$_POST	= Core::AddSlashesArray($_POST);
	$_GET	= Core::AddSlashesArray($_GET);

	/****************************************\
	|            	SETTING MENU               |
	\****************************************/
	$Menu = new CoreMenu();

	/****************************************\
	|            	 SETTING HEAD              |
	\****************************************/
	$Head	= new CoreHead();
	$Head	->SetFavicon("../../../../skin/images/body/icons/favicon.ico");
	$Head	->SetOrganization($CoreUser->Data['organization']['name']);

	/****************************************\
	|            	SETTING FOOTER             |
	\****************************************/
	$Foot	= new CoreFoot();
?>
