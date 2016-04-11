<?php
class Database {
    private $servername="localhost";
    private $username="kingmaker";
    private $password="dunedsjgi4h2h91441";
    private $database="kingmaker";

    public function query($Q) {
        $conn = new mysqli($this->servername, $this->username, $this->password, $this->database);
        
        // Check connection
        if($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $res = $conn->query($Q);

        while($row = $res->fetch_assoc()) {
            $result[] = $row;
        }

        $conn->close();
        return $result;
    }
}
?>