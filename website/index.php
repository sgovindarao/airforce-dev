<!doctype html>
<html lang='en'>
<head>
	<meta charset='utf-8'>
	<title>Air force </title>
	<link rel="stylesheet" type="text/css" href="vendor/jquery-ui/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="css/global.css">
</head>
<body>
<div id='header' style="background-color:#3190B0;line-height:75px;padding-left:15px;color:#fff">
	<h2>Air Force Veterans Management System</h2>
</div>	
<div id='main'>
	<div class="nav_button">
	
		<div class="column__button" data-correspondingDiv="diplay_circular_no" id="cirInfo">Circular Info</div>
		<div class="column__button" data-correspondingDiv="diplay_employee_details" id="empDet">Employee Details</div>
		<div class="column__button" data-correspondingDiv="search_circular_no" id="searchByCir">Search By Circular No</div>
		<div class="column__button" data-correspondingDiv="search_employee_id" id="searchByEmp">Search By Employee Id</div>

	</div>
	<br/><br/>		
	<div id="display_show_hide">
		
		<div id="diplay_circular_no" class="dynamic_div">
			<div class="data_table">
				<form id="form_diplay_circular_no">
					<div class="input_pair">
						<div><label class="">Circular Number</label></div>
						<div><input name="circularNo" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Rank</label></div>
						<div><input name="rank" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Group</label></div>
						<div><input name="group" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Issue Date</label></div>
						<div><input name="circular_issue_date" class="dateField" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Effective Date</label></div>
						<div><input name="circular_effective_date" class="dateField" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Status</label></div>
						<div><input name="circular_status" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Amount</label></div>
						<div><input name="amount" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Service Period</label></div>
						<div><input name="service_period" class="" type="text"></div>
					</div>		
					<div>
						<div>Type</div>
						<div><select name="service_type"><option>Type</option></select></div>
					</div>	
				</form>	
			</div>
			<div class="submit_button" data-parentId="diplay_circular_no">Submit</div>
		</div>
		
		<div id="diplay_employee_details" class="dynamic_div">
			<div class="data_table">
				<form id="form_diplay_employee_details">
					<div class="input_pair">
						<div><label class="">First Name</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Last Name</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Service Number</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Membership Number</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Address 1</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Address 2</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Street</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">City</label></div>
						<div><input name="" class="" type="text"></div>
					</div>		
					<div class="input_pair">
						<div><label class="">State</label></div>
						<div><input name="" class="" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">Pin Code</label></div>
						<div><input name="" class="" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">Mobile</label></div>
						<div><input name="" class="" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">Office Phone</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Residential Phone</label></div>
						<div><input name="" class="" type="text"></div>
					</div>		
					<div class="input_pair">
						<div><label class="">Email Id</label></div>
						<div><input name="" class="" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">Trade</label></div>
						<div><input name="" class="" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">Date of Birth</label></div>
						<div><input name="" class="dateField" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">Date of Expiry</label></div>
						<div><input name="" class="dateField" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">Date of Enrollment</label></div>
						<div><input name="" class="dateField" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">Awards</label></div>
						<div><input name="" class="" type="text"></div>
					</div>	
					<div class="input_pair">
						<div><label class="">TN-Membership No</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
				</form>
			</div>
			<div class="submit_button" data-parentId="diplay_employee_details">Submit</div>
		</div>	
		
		<div id="search_circular_no" class="dynamic_div">
			<div class="data_table">
				<form id="form_search_circular_no">
					<div class="input_pair">
						<div><label class="">Circular Number</label></div>
						<div><input name="circularNo" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Rank</label></div>
						<div><select name="rank"></select></div>
					</div>
					<div class="input_pair">
						<div><label class="">Group</label></div>
						<div><input name="group" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Service Type</label></div>
						<div><select name="service_type"><option>1</option></select></div>
					</div>
				</form>		
			</div>
			<div class="submit_button" data-parentId="search_circular_no">Submit</div>
			<div class="show_records">
				<div class="show_records_head"></div>
				<div class="show_records_body"></div>
			</div>
		</div>	

		<div id="search_employee_id" class="dynamic_div">
			<div class="data_table">
				<form id="form_search_employee_id">
					<div class="input_pair">
						<div><label class="">Service Number</label></div>
						<div><input name="" class="" type="text"></div>
					</div>
					<div class="input_pair">
						<div><label class="">Membership Number</label></div>
						<div><select><option>1</option></select></div>
					</div>
				</form>
			</div>
			<div class="submit_button" data-parentId="search_employee_id">Submit</div>
			<div class="show_records">
				<div class="show_records_head"></div>
				<div class="show_records_body"></div>
			</div>
		</div>				
		
	</div>
</div>
<!-- <div id='footer'><img src="images/logo.jpg"></div> -->

<!-- /*====================================================
PAGE CONTENT ENDS
======================================================*/-->

<script src="vendor/jquery/jquery.js"></script>
<script src="vendor/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript">

/*====================================================
GLOBAL VARIABLES
======================================================*/
// var domain                    = "http://www.afpms.com/";
var domain                    = "http://localhost/";
var afpmsFolder               = "afpms";
var afpmsFolderPath           = domain+afpmsFolder+"/";
var moduleBackendFolder       = "backend";
var moduleBackendFolderPath   = afpmsFolderPath+moduleBackendFolder+"/";
var moduleFrontendFolder      = "frontend";
var moduleFrontendFolderPath  = afpmsFolderPath+moduleFrontendFolder+"/";

/*====================================================
FUNCTION DEFINATIONS
======================================================*/
function handle_callerBtn(divToHanlde) {
	if(divToHanlde == "diplay_circular_no" || divToHanlde == "diplay_employee_details") {

	}
	else if(divToHanlde == "search_circular_no" || divToHanlde == "search_employee_id") {
		
	}
	else {
		// exception. fail silently with dev warning
	}
}

function validate_vals(fDiv) {
	// validation logic here. Mind not working now :(
	return 1;
}


function send_vals(fDiv, phpFile) {
	if(validate_vals(fDiv)) {
		$.ajax({
			url : moduleBackendFolderPath+phpFile,
			dataType : "JSON",
			data :  $("#form_"+fDiv).serialize(),
			type : "POST",

			error : function(jqXHR) {
				console.log(jqXHR);
				// log errors instead of this bullshit
			},

			success : function(response) {
				if(response['status']==0) {
					return;
				}
				
				// send to success handlers
				handle_success(fDiv, response);
			}
		});		// end of AJAX
	}
}

function handle_success(fDiv, response) {
	if(fDiv == 'diplay_circular_no' || fDiv == 'diplay_employee_details') {
		// blur div and append overlay informing status 
		var appendOverlay = "<div class='localized_overlay' id='ol_"+fDiv+"'>"+response['status']+"</div>";
		$("#"+fDiv).append(appendOverlay);
	}
	else if(fDiv == 'search_circular_no' || fDiv == 'search_employee_id') {
		create_table(fDiv, response['details']);
	}
}

function create_table(fDiv, recordsArr) {
	if(fDiv == 'search_circular_no') {
		var headerRow = "";
		headerRow += "<div data-celltype='first_name' class='header_cell'> First Name </div>";
		headerRow += "<div data-celltype='last_name' class='header_cell'> Last Name </div>";
		headerRow += "<div data-celltype='service_no' class='header_cell'> Service Number </div>";
		headerRow += "<div data-celltype='membership_no' class='header_cell'> Membership Number </div>";
		headerRow += "<div data-celltype='email' class='header_cell'> E-mail </div>";
		headerRow += "<div data-celltype='amount' class='header_cell'> Amount </div>";
		headerRow += "<div data-celltype='service_type' class='header_cell'> Service Type </div>";

		$("#"+fDiv+" .show_records_head").append(headerRow);

		$.each(recordsArr, function(i,val) {
			var bodyRow = "";
			bodyRow += "<div data-celltype='first_name' class='record_cell'>"+val['first_name']+"</div>";

			bodyRow += "<div data-celltype='last_name' class='record_cell'>"+val['last_name']+"</div>";

			bodyRow += "<div data-celltype='service_no' class='record_cell'>"+val['service_no']+"</div>";

			bodyRow += "<div data-celltype='membership_no' class='record_cell'>"+val['membership_no']+"</div>";
			bodyRow += "<div data-celltype='email' class='record_cell'>"+val['email']+"</div>";
			bodyRow += "<div data-celltype='amount' class='record_cell'>"+val['amount']+"</div>";
			bodyRow += "<div data-celltype='rank' class='record_cell'>"+val['rank']+"</div>";
			bodyRow += "<div data-celltype='group' class='record_cell'>"+val['group']+"</div>";
			bodyRow += "<div data-celltype='service_type' class='record_cell'>"+val['service_type']+"</div>";
			
			$("#"+fDiv).find(".show_records > .show_records_body").append(bodyRow);
		});
	}
	else if(fDiv == 'search_circular_no') {
		
	}

}
/*

|~\ _  _    _ _  _  _ _|_  |  _  _  _| _  _|
|_/(_)(_|_|| | |(/_| | |   |_(_)(_|(_|(/_(_|
																								 
*/
$(document).ready(function() {
	// select tag
	$(".column__button").click(function() {
		var divToShow = $(this).attr("data-correspondingDiv");
		// console.log(divToShow);
		$(".dynamic_div").fadeOut(100);
		$("#"+divToShow).fadeIn("fast");

		handle_callerBtn(divToShow);
	});

	$(".dateField").datepicker({			// jQuery-ui datepicker
		numberOfMonths: 3,
		dateFormat : "yy:mm:dd",
	});

	// get ranks
	$.ajax({
		url : moduleBackendFolderPath+"action.get_rank.php",
		dataType : "JSON",

		success : function(response) {
			// console.log(response);
			$.each(response, function(i,val) {
				// console.log(val);
				$('select[name=rank]').append($("<option></option>").attr("value",val).text(val));
			});
		}
	});

	$(".submit_button").click(function() {		// get parentDiv id and run funtion to send values
		parentDivID = $(this).attr("data-parentId");
		if(parentDivID=='diplay_circular_no') {
			send_vals(parentDivID,"action.insert_circular.php");
		}
		else if(parentDivID=='diplay_employee_details') {
			// send_vals(parentDivID,"action.insert_circular.php");
		}
		else if(parentDivID=='search_circular_no') {
			send_vals(parentDivID,"action.select_personal_by_circular_no.php");
		}
		else if(parentDivID=='search_employee_id') {
			send_vals(parentDivID,"action.select_personal_by_employee_id.php");
		}
		else {

		}
	});
});
</script>

</body>
</html>