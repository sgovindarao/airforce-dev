<?php

// File to insert the veteran details in the respectve table

// Comment below two lines to hide errors
ini_set("display_errors", "1");
error_reporting(E_ALL);
// ---

$fname = $POST['fname'];
$lname = $POST['lname'];
$serviceno = $POST['serviceno'];
$membershipno = $POST['membershipno'];

$address1 = $POST['address1'];
$address2 = $POST['address2'];
$street= $POST['street'];
$city = $POST['city'];
$state = $POST['state'];
$pincode = $POST['pincode'];

$numsAvailable = array();
if(!($POST['mobile']   == '' || $POST['mobile'] == null)) {
	$numsAvailable[] =  array('num'=> $POST['mobile'],'type'=> 'MOB');
}
if(!($POST['ofcode']   == '' || $POST['ofcode'] == null)) {
	$numsAvailable[] =  array('num'=> $POST['ofcode'],'type'=> 'OFC');
}
if(!($POST['ofcphone'] == '' || $POST['ofcphone'] == null)) {
	$numsAvailable[] =  array('num'=> $POST['ofcphone'],'type'=> 'OFLL');
}
if(!($POST['rescode']  == '' || $POST['rescode'] == null)) {
	$numsAvailable[] =  array('num'=> $POST['rescode'],'type'=> 'HMC');
}
if(!($POST['resphone'] == '' || $POST['resphone'] == null))	{
	$numsAvailable[] =  array('num'=> $POST['resphone'],'type'=> 'HMLL');
}

$email= $POST['email'];

$trade = $POST['trade'];
$dobirth = $POST['dobirth'];
$doexpire = $POST['doexpire'];
$doenroll = $POST['doenroll'];
$dodischarge= $POST['dodischarge'];

$awards = $POST['awards'];
$tnmembno= $POST['tnmemno'];
$rank= $POST['rank'];
$groupid = $POST['groupid'];

// if date of expiry is null - the service type is family (i.e 2) else indivaidual(i.e 1)

if (($doexpire == '') || ($doexpire == null)) {
	$servicetype = 2;
} else { 
	$servicetype = 1;
}

//echo $servicetype;

// calculation of service period 
$objDoenroll = date_create($doenroll);
$objDischarge = date_create($dodischarge);

$serviceperiod = $objDoenroll->diff($objDischarge);
$year = $serviceperiod-> format("%y");
$month = $serviceperiod-> format("%m");
if ( $month <= 5) {
	$month= 0;
} else {
	$month = 5;
}
$serviceperiod = $year.".".$month;

require_once "vars/dbvars.php";

try {
	$conn = mysqli_connect($host, $username, $password, "afpms");
		
	if(mysqli_connect_errno()) {
		throw new Exception(mysqli_connect_error(), 1);
	}
	
	// Set autocommit to off
	mysqli_autocommit($conn,FALSE);

	// INSERT PERSONAL DETAILS
	$sql = "INSERT INTO afpms_personal_info (first_name, last_name, address1, address2, street, city, state, pincode, email, date_of_birth, date_of_expiry) VALUES ('$fname', '$lname', '$address1', '$address2', '$street', '$city', '$state', '$pincode', '$email', '$dobirth', '$doexpire')";
	mysqli_query($conn, $sql);

	$per_id = mysqli_insert_id($conn);
	
	//INSERT PHONE NUMBER (ENUM)
	foreach ($numsAvailable as $key => $value) {
		mysqli_query($conn, "INSERT INTO afpms_personal_phone_info (afpms_personal_info_id, digit, type) VALUES ($per_id, {$value['num']}, '{$value['type']}')");
	}

	//INSERT SERVICE INFORMATION - FIRST get the "circular_categorization_info_id"

	$query_afpms_circular_categorization_info = "select id from  afpms_circular_categorization_info where rank = '$rank' and group_id = $groupid and service_period = $serviceperiod and service_type = $servicetype";

	if(!$res_afpms_circular_categorization_info_id = mysqli_query($conn, $query_afpms_circular_categorization_info)) {
		throw new Exception(mysqli_error($mysqli), 2);
	}

	if(mysqli_num_rows($res_afpms_circular_categorization_info_id)==0) {
		throw new Exception(mysqli_error($conn), 3);
	}

	while($row = mysqli_fetch_assoc($res_afpms_circular_categorization_info_id)) {
		$afpms_circular_categorization_info_id = $row['id'];
	}
				
		
	//INSERT SERVICE INFORMATION
	mysqli_query($conn, "INSERT INTO afpms_personal_service_info (afpms_personal_info_id, afpms_circular_categorization_info_id, awards, tn_membership_no, trade) VALUES ($per_id, $afpms_circular_categorization_info_id, '$awards', $tnmembno, '$trade')");

	//INSERTION FOR UNIQUE IDENTITY OF VETERAN
	mysqli_query($conn, "INSERT INTO afpms_personal_service_identity_info (afpms_personal_info_id, service_no, membership_no) VALUES ($per_id, $serviceno, $membershipno)");

	//INSERT DURATION DETAIL
	mysqli_query($conn, "INSERT INTO afpms_personal_service_duration_info (afpms_personal_info_id, date_of_discharge, date_of_enrollment, service_period) VALUES ('$per_id', '$dodischarge', '$doenroll', '$serviceperiod')");

	// Commit transaction
	mysqli_commit($conn);

	mysqli_close($conn);
}

catch(Exception $error) {
	if($error->getCode() == 1) {
		echo "Could not connect to DB :: ".$error->getMessage();
	}
	else {
		if($error->getCode() == 2) {
			echo "Query Error :: ".$error->getMessage();
		}
		if($error->getCode() == 3) {
			echo json_encode(array(0));
		}
		mysqli_close($conn);
	}
}

exit;