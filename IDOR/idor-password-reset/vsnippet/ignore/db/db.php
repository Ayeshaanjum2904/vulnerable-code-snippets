<?php
//This file can be ignore (only used to connect to the database)

//Connect to database:
//Note : This is for the docker only, feel free to change to whatever you like:
$db_host = getenv('DB_HOST') ?: 'db-mysql';
$db_database = getenv('DB_DATABASE') ?: 'ywhvsnippet';
$db_username = getenv('DB_USERNAME') ?: 'vsnippet';
$db_password = getenv('DB_PASSWORD') ?: 'secure_default_password';

// Create connection
$mysqlDB = new mysqli($db_host, $db_username, $db_password, $db_database);

// Check connection
if ($mysqlDB->connect_error) {
    die("Connection failed: " . $mysqlDB->connect_error);
}

?>