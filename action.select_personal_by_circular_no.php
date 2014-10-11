<?php
// Comment below two lines to hide errors
ini_set("display_errors", "1");
error_reporting(E_ALL);
// ---

$circularNo = $_GET['circularNo'];
$rank=(!empty($_GET['rank']) ? trim($_GET['rank']) : "");
$group=(!empty($_GET['group']) ? trim($_GET['group']) : "");
$service_type=(!empty($_GET['service_type']) ? trim($_GET['service_type']) : "");


require_once "vars/dbvars.php";



	try 
	{
		$mysqli = new mysqli($host, $username, $password, "afpms");
		
		
		/* check connection */
		if (mysqli_connect_errno()) {
    	throw new Exception(mysqli_connect_error(), 1);
    	}
    	

		$query_search_personal_info_by_cir_id = "select first_name,last_name,service_no,membership_no,email,amount,rank,group_name,service_type from afpms_circular_info_all_view, afpms_personal_info_all_view where afpms_circular_info_all_view.CategorizationID =afpms_personal_info_all_view.CategorizationID and afpms_circular_info_all_view.circular_no='$circularNo'";

		if (!empty($rank )) {
			$query_search_personal_info_by_cir_id = $query_search_personal_info_by_cir_id .  "and rank = '$rank'";
		}
		if (!empty($group )) {
			$query_search_personal_info_by_cir_id = $query_search_personal_info_by_cir_id . "and group_id = '$group'";
		}

		if (!empty($service_type )) {
			//printf($query_search_personal_info_by_cir_id);
			$query_search_personal_info_by_cir_id = $query_search_personal_info_by_cir_id . "and service_type = '$service_type'";
			//printf($query_search_personal_info_by_cir_id);
		}

		
		$mysqli->query($query_search_personal_info_by_cir_id);

		
		if(!$res_search_personal_info_by_cir_id = $mysqli->query($query_search_personal_info_by_cir_id)) {
			throw new Exception(mysqli_error($mysqli), 2);
		}

		if(mysqli_num_rows($res_search_personal_info_by_cir_id)==0) {
			throw new Exception(0, 3);
		}

		$resultsArr = array();

		while($row = $res_search_personal_info_by_cir_id->fetch_assoc()) {
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