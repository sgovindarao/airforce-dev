<?php
// Comment below two lines to hide errors
ini_set("display_errors", "1");
error_reporting(E_ALL);
// ---

$circularNo = $_GET['circularNo'];
$circular_issue_date = $_GET['circular_issue_date'];
$circular_effective_date = $_GET['circular_effective_date'];
$circular_status = $_GET['circular_status']; //may be it will be one

$rank = $_GET['rank'];
$group = $_GET['group'];
$service_period = $_GET['service_period'];
$service_type = $_GET['service_type'];

$amount = $_GET['amount'];

require_once "vars/dbvars.php";
$mysqli = new mysqli($host, $username, $password, "afpms");

function insert_afms_circular_info($circularNo, $circular_issue_date,$circular_effective_date,$circular_status) 
{ 

	try 
	{
		
		
		
		/* check connection */
		if (mysqli_connect_errno()) {
    	throw new Exception(mysqli_connect_error(), 1);
    	}

		$query_afms_circular_info = "INSERT INTO afpms_circular_info ( `circular_no`, `circular_issue_date`, `circular_effective_date`, `circular_status`) VALUES ($circularNo,$circular_issue_date,$circular_effective_date,$circular_status)";

		$mysqli->query($query_afms_circular_info);
		
		printf ("New Record has id %d.\n", $mysqli->insert_id);
		
		$afpms_circular_info_id = $mysqli->insert_id;

		return $afpms_circular_info_id;

	}
	catch(Exception $error)
	{
		if($error->getCode() == 1) 
		{
			echo "Could not connect to DB :: ".$error->getMessage();
		}
	
		$mysqli->close();
	}

}

function select_afpms_circular_categorization_info($rank, $group,$service_period,$service_type) 
{ 

	try 
	{
		
		
		
		/* check connection */
		if (mysqli_connect_errno()) {
    	throw new Exception(mysqli_connect_error(), 1);
    	}

		$query_afpms_circular_categorization_info = "select id from  afpms_circular_categorization_info where rank = $rank and group = $group and service_period = $service_period and service_type = $service_type";

				
		if(!$afpms_circular_categorization_info_id = $mysqli->query($query_afpms_circular_categorization_info)) {
		throw new Exception(mysqli_error($conn), 2);
		}

		if(mysqli_num_rows($afpms_circular_categorization_info_id)==0) {
		throw new Exception(0, 3);
		}
		
		return $afpms_circular_categorization_info_id;


	}
	catch(Exception $error)
	{
		if($error->getCode() == 1) 
		{
			echo "Could not connect to DB :: ".$error->getMessage();
		}
		else {
		if($error->getCode() == 2) {
			echo "Query Error :: ".$error->getMessage();
		}
		if($error->getCode() == 3) {
			echo "Data not found";
		}
		}
	
		$mysqli->close();
	}

}
function insert_afpms_circular_amount_info($afpms_circular_info_id,$afpms_circular_categorization_info_id)
{
	try 
	{
		
		
		
		/* check connection */
		if (mysqli_connect_errno()) {
    	throw new Exception(mysqli_connect_error(), 1);
    	}

		$query_afpms_circular_amount_info = "INSERT INTO afpms_circular_amount_info (`afpms_circular_info_id`, `afpms_circular_categorization_info_id`, `amount`) VALUES ($afpms_circular_info_id,$afpms_circular_categorization_info_id,$amount)";

		$mysqli->query($query_afpms_circular_amount_info);
			
	}
	catch(Exception $error)
	{
		if($error->getCode() == 1) 
		{
			echo "Could not connect to DB :: ".$error->getMessage();
		}
	
		$mysqli->close();
	}

}
$afpms_circular_info_id = insert_afms_circular_info($circularNo, $circular_issue_date,$circular_effective_date,$circular_status);
$afpms_circular_categorization_info_id= select_afpms_circular_categorization_info($rank, $group,$service_period,$service_type);
insert_afpms_circular_amount_info($afpms_circular_info_id,$afpms_circular_categorization_info_id);

exit;