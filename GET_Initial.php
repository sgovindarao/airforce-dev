<?php
/*
 * Author : Janani Iyer
 *
 * This file will get all setups and return as JSON
 */
 
// Comment below two lines to hide errors
ini_set("display_errors", "1");
error_reporting(E_ALL);
// ---

require_once "vars/dbvars.php";

$connect = mysqli_connect($host, $username, $password);
if(mysqli_connect_errno()) {
	echo mysqli_connect_error();
}
$queryFetchSetup = "select id, setup from `pas_db`.`master_setup` where 1";
$result = mysqli_query($connect, $queryFetchSetup);

$returnValSetup = array();
while ($row = mysqli_fetch_assoc($result)) {
	array_push($returnValSetup, $row);
}

$queryFetchCustomer = "select c_id, customer from `pas_db`.`master_customer` where 1";
$result = mysqli_query($connect, $queryFetchCustomer);

$returnValCust = array();
while ($row = mysqli_fetch_assoc($result)) {
	array_push($returnValCust, $row);
}

mysqli_close($connect);

echo json_encode(array('setup' => $returnValSetup, 'customers' => $returnValCust));