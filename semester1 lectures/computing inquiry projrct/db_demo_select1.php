<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8 " />
	<title>PHP - MySQL Select (Check) Template</title>
	<!-- other meta here -->
</head>
<body>
<?php
	
	require_once "settings.php";	// Load MySQL log in credentials
	$conn = @mysqli_connect ($host,$user,$pwd,$sql_db);	// Log in and use database
	if ($conn) { // check is database is available for use
		$query = "SELECT * from `students`";		// Assign appropriate query here
		$result = mysqli_query ($conn, $query);
		if ($result) {								// check if query was successfully executed
			$record = mysqli_fetch_assoc ($result);
            
			if ($record) {							// check if any record exists
				echo "<p>At least 1 record was retrieved.</p>";
				mysqli_free_result ($result);	// Free up resources
			} else {
				echo "<p>No records retrieved.</p>";
			}
		} else {
			echo "<p>Select operation unsuccessful.</p>";
		}
        
        
		mysqli_close ($conn);					// Close the database connect
	} else {
		echo "<p>Unable to connect to the database.</p>";
	}
?>	
</body>
</html>