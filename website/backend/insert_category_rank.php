<?php

ini_set("display_errors","1"); error_reporting(E_ALL);   

require_once "vars/dbvars.php";

    $mysqli = new mysqli($host, $username, $password, "afpms");

    /* check connection */
    if (mysqli_connect_errno()) {
        throw new Exception(mysqli_connect_error(), 1);
    }

    /* turn autocommit on */
    $mysqli->autocommit(TRUE);

    $rank_array = array("AIR MSHL","AVM","AIR CMDE","GP CAPT","WG CDR","SQN LDR","FLT LT","FG OFFR","PLT OFFR","HFL","HFO","MWO","WO","JWO","SGT","CPL","LAC","AC","AC II","NC(E)");
    
             foreach($rank_array as $rank) {
                    $query_afms_circular_rank_info = "INSERT INTO afpms_circular_rank_info ( `rank`) VALUES ($rank)";
                    $mysqli->query($query_afms_circular_rank_info);
					printf($query_afms_circular_rank_info);
                }
    $mysqli->close();
exit();