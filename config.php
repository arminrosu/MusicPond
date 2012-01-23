<?php
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// MUSICPOND SETTINGS
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	define('SHUFFLE', true);
	define('COUNTRY', 'RO');
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// set generic functions path
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	define('ROOT_PATH', realpath(".") . '/');
	
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// DATABASE
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	define('DB_HOST', 'localhost'); // hostname
	define('DB_NAME', 'musicpond'); // database
	define('DB_USER', 'username'); // username
	define('DB_PASS', 'super_safe_password'); // password
	
	// our table
	define('DB_TABLE', 'musicpond');
?>