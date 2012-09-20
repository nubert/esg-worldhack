<?php 

require_once '../lib/db.php';


$query = "SELECT * FROM verbs";
$result = mysql_query($query, $dbConn);

while ($row = mysql_fetch_assoc($result)) {
    print_r($row);
}
