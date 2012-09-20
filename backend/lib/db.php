<?php 

require_once 'config.php';

class DB
{
    protected $dbConn = '';
    protected $dbHost = '';
    protected $dbUser = '';
    protected $dbPass = '';
    protected $dbName = '';


    protected function __construct($dbHost, $dbUser, $dbPass, $dbName)
    {
        $this->dbHost = $dbHost;
        $this->dbUser = $dbUser;
        $this->dbPass = $dbPass;
        $this->dbName = $dbName;
    }


    public function connect()
    {
        if (!$this->db) {
            $this->db = mysql_connect($this->dbHost, $this->dbUser, $this->dbPass);
        }
        mysql_select_db($this->dbName);
        return $this->db;
    }

}