<?php

require_once "vars/dbvars.php";

try
{
    $mysqli = new mysqli($host, $username, $password, "afpms");

    /* check connection */
    if (mysqli_connect_errno()) {
        throw new Exception(mysqli_connect_error(), 1);
    }

    /* turn autocommit on */
    $mysqli->autocommit(TRUE);

    $rank_array = array("AIR MSHL","AVM","AIR CMDE","GP CAPT","WG CDR","SQN LDR","FLT LT","FG OFFR","PLT OFFR","HFL","HFO","MWO","WO","JWO","SGT","CPL","LAC","AC","AC II","NC(E)");
    $group_id_array = array("1","2","3","4");
    $service_type_array = array("1","2");
    $service_period_array = array("10","10.5","11","11.5","12","12.5","13","13.5","14","14.5","15","15.5","16","16.5","17","17.5","18","18.5","19","19.5","20","20.5","21","21.5","22","22.5","23","23.5","24","24.5","25","25.5","26","26.5","27","27.5","28","28.5","29","29.5","30");

    foreach($service_type_array as $service_type) {
        foreach($group_id_array as $group_id) {
             foreach($rank_array as $rank) {
                foreach($service_period_array as $service_period) {
                    $query_afms_circular_categorization_info = "INSERT INTO afpms_circular_categorization_info ( `rank`, `group_id`, `service_period`, `service_type`) VALUES ('$rank','$group_id','$service_period','$service_type')";
                    $mysqli->query($query_afms_circular_categorization_info);
					printf($query_afms_circular_categorization_info);
                }
            }
        }
    }

    $mysqli->close();
}
catch(Exception $error)
{
    $mysqli->close();
}
exit();