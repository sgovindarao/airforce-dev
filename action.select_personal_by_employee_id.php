<?php
// Comment below two lines to hide errors
ini_set("display_errors", "1");
error_reporting(E_ALL);
// ---


$serviceno=(!empty($_GET['serviceno']) ? trim($_GET['serviceno']) : "");
$memberno=(!empty($_GET['memberno']) ? trim($_GET['memberno']) : "");



require_once "vars/dbvars.php";



	try 
	{
		$mysqli = new mysqli($host, $username, $password, "afpms");
		
		
		/* check connection */
		if (mysqli_connect_errno()) {
    	throw new Exception(mysqli_connect_error(), 1);
    	}
    	

		$query_search_personal_by_employee_id = "select first_name,last_name,service_no,membership_no,email,amount,rank,group_name,service_type from afpms_circular_info_all_view, afpms_personal_info_all_view where afpms_circular_info_all_view.CategorizationID =afpms_personal_info_all_view.CategorizationID ";

		if (!empty($serviceno )) {
			$query_search_personal_by_employee_id = $query_search_personal_by_employee_id .  "and service_no = '$serviceno'";
		}
		if (!empty($memberno )) {
			$query_search_personal_by_employee_id = $query_search_personal_by_employee_id . "and membership_no = '$memberno'";
		}

		
		
		$mysqli->query($query_search_personal_by_employee_id);

		
		if(!$res_search_personal_by_employee_id = $mysqli->query($query_search_personal_by_employee_id)) {
			throw new Exception(mysqli_error($mysqli), 2);
		}

		if(mysqli_num_rows($res_search_personal_by_employee_id)==0) {
			throw new Exception(0, 3);
		}

		$resultsArr = array();

		while($row = $res_search_personal_by_employee_id->fetch_assoc()) {
			$resultsArr[] = $row;
		}
		
		$sendArr = array();
		foreach($resultsArr as $rowNo => $row) {
			$sendArr[] = array(
			'first_name' => $row['first_name'],
			'last_name' => $row['last_name'],
			'service_no' => $row['service_no'],
			'membership_no' => $row['membership_no'],
			'email' => $row['email'],
			'amount' => $row['amount'],
			'rank' => $row['rank'],
			'group' => $row['group_name'],
			'service_type' => $row['service_type'],
			);
		}
	// print_r($sendArr);
	$sendValues = json_encode($sendArr);
	echo $sendValues;
		
	}
	catch(Exception $error)
	{
		if($error->getCode() == 1) 
		{
			echo "Could not connect to DB :: ".$error->getMessage();
		}
		if($error->getCode() == 2) 
		{
				echo "No Id present ";
		}	
		if($error->getCode() == 3) 
		{
				echo "no result found ";
		}
		if($error->getCode() == 4) 
		{
				echo "Circular Number is already present ";
		}


	}
	$mysqli->close();
exit;