<?php

/**
 * Author : Kunal Bhagawati
 * 
 * A set of common functions that are used frequently
 */


/**
 * Function to take a variable and echo it back in the specified format
 * @param 	[array, object, etc.]	$arg 					if  argument == ( int, char, boolean, strings, or other basic datatypes) echo $arg 
 *                         									else if argument == ( object, array) print_r($arg)
 *
 * @param	[character, string]		$symbol 				Symbol to append before (and after if inline flag not set) $arg
 *  		
 *    			Eg.
 *	     			echo_back("a","*")
 *	       		OUTPUT
 *         			***
 *	          		a
 *            		***
 *            		
 * @param	[number]				$symbolRepeatTimes 		Number of times to repeat $symbol.
 *
 *		 		eg. 
 * 					echo_back("a","-",5)
 *       		OUTPUT
 * 					-----
 * 					a
 * 					-----
 * 
 * @param	[boolean] 				$inline            		(if argument != (array, object)) set return as inline 
 * 			
 *        		eg. 
 *    				echo_back("a","-",5,true)
 *    	   		OUTPUT
 *    				----- a
 * 			  		
 */
function echo_back($arg, $symbol=null, $symbolRepeatTimes=3, $inline=false) {
	if($symbol)
	{
		for($i=0; $i<$symbolRepeatTimes; $i++)
			echo $symbol;
	}

		if(is_array($arg) || is_object($arg))
		{
			echo "<pre>";
			print_r($arg);
			echo "</pre>";
		}

		else
		{
			if($inline == true || $inline === true)
			echo " ".$arg." <br>";
			
			else echo "<br>".$arg."<br>";

		}

	if(($inline == false || inline === false) || (is_array($arg) || is_object($arg)) )
	{
		if($symbol)
		{
			for($i=0; $i<$symbolRepeatTimes; $i++)
				echo $symbol;

			echo "<br>";
		}

	}

}

/* Function to take a set of characters as string and return a random string using those characters
*
* @param 	[string] 	$chars 					Characters that are to be randomized.
*           [number] 	$lengthOfOutputString	In case not given, length of the argument is taken
*/
function get_random_string($chars, $lengthOfOutputString=null) {	
	if($lengthOfOutputString == null || $lengthOfOutputString === null )
	{
		$lengthOfOutputString = strlen($chars);
	}

	$randomString = "";

	$numChars = strlen($chars);

	for ($i = 0; $i < $lengthOfOutputString; $i++)
	{
		$randomPick = mt_rand(1, $numChars);

		$randomChar = $chars[$randomPick-1];

		$randomString .= $randomChar;
	}

	// return random string
	return $randomString;
}


// // echo back variable in json format
function echo_json($param) {
	echo encode_json($param);
}


// // exit with variable in json format
function exit_json($param) {
	exit(encode_json($param));
}


/**
 * return variable in json format.
 * @param 	[array, string] 	$param 		value to be json encoded
 * @return 	[string]        				encoded value
 */
function encode_json($param) {
	if(is_array($param) || is_object($param)) {
		return json_encode($param);
	}
	else {
		return json_encode(array($param));
	}
}