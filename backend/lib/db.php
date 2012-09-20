<?php 

require_once 'config.php';

class DB
{
    protected $dbConn = '';
    protected $dbHost = '';
    protected $dbUser = '';
    protected $dbPass = '';
    protected $dbName = '';


    public function __construct($dbHost, $dbUser, $dbPass, $dbName)
    {
        $this->dbHost = $dbHost;
        $this->dbUser = $dbUser;
        $this->dbPass = $dbPass;
        $this->dbName = $dbName;
    }


    public function connect()
    {
        if (!$this->dbConn) {
            $this->dbConn = mysql_connect($this->dbHost, $this->dbUser, $this->dbPass);
        }
        mysql_select_db($this->dbName);
        return $this->dbConn;
    }

}

$db = new DB($dbHost, $dbUser, $dbPass, $dbName);
$dbConn = $db->connect();

