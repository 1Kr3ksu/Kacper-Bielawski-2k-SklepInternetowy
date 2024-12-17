<?php
$conn = new mysqli("localhost", "root", "", "sklep-internetowy");
if ($conn->connect_error) {
    die("Połączenie nieudane: " . $conn->connect_error);
    echo "Error ".$conn->connect_error;
}
?>