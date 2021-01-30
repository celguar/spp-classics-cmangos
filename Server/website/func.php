<?php

class DBLayer
{
    public $link_id;
    public $query_result;
    public $saved_queries = array();
    public $num_queries = 0;

    public function __construct($db_host, $db_username, $db_password, $db_name)
    {
        $this->link_id = mysqli_connect($db_host, $db_username, $db_password);

        if ($this->link_id) {
            if (mysqli_select_db($this->link_id, $db_name)) {
                return $this->link_id;
            } else {
                //error('Unable to select database. MySQL reported: '.mysqli_error());
                $this->close();
            }
        } else {
            //error('Unable to connect to MySQL server. MySQL reported: '.mysqli_error());

            $this->link_id = false;
        }
    }

    public function isValid()
    {
        return $this->link_id;
    }

    public function query($sql)
    {
        if (!$this->link_id) {
            return false;
        }

        $this->query_result = mysqli_query($this->link_id, $sql);

        if ($this->query_result) {
            ++$this->num_queries;
            return $this->query_result;
        } else {
            return false;
        }
    }


    public function result($query_id = 0, $row = 0)
    {
        return ($query_id) ? mysqli_result($query_id, $row) : false;
    }


    public function fetch_assoc($query_id = 0)
    {
        return ($query_id) ? mysqli_fetch_assoc($query_id) : false;
    }


    public function fetch_row($query_id = 0)
    {
        return ($query_id) ? mysqli_fetch_row($query_id) : false;
    }


    public function num_rows($query_id = 0)
    {
        return ($query_id) ? mysqli_num_rows($query_id) : false;
    }


    public function affected_rows()
    {
        return ($this->link_id) ? mysqli_affected_rows($this->link_id) : false;
    }


    public function insert_id()
    {
        return ($this->link_id) ? mysqli_insert_id($this->link_id) : false;
    }


    public function get_num_queries()
    {
        return $this->num_queries;
    }


    public function get_saved_queries()
    {
        return $this->saved_queries;
    }


    public function free_result($query_id = false)
    {
        return ($query_id) ? mysqli_free_result($query_id) : false;
    }


    public function escape($str)
    {
        if (function_exists('mysqli_real_escape_string')) {
            return mysqli_real_escape_string($str, $this->link_id);
        } else {
            return mysqli_escape_string($str);
        }
    }


    public function error()
    {
        $result['error_sql'] = @current(@end($this->saved_queries));
        $result['error_no'] = $this->link_id ? mysqli_errno($this->link_id) : mysqli_errno();
        $result['error_msg'] = $this->link_id ? mysqli_error($this->link_id) : mysqli_error();

        return $result;
    }


    public function close()
    {
        if ($this->link_id) {
            if ($this->query_result) {
                mysqli_free_result($this->query_result);
            }

            return mysqli_close($this->link_id);
        } else {
            return false;
        }
    }
}

function error($message)
{
    $s = 'Error: <strong>'.$message.'.</strong>';
    echo $s;
}

function sort_players($a, $b)
{
    if ($a['leaderGuid'] == $b['leaderGuid']) {
        return strcmp($a['name'], $b['name']);
    }
    return ($a['leaderGuid'] < $b['leaderGuid']) ? -1 : 1;
}

function get_zone_name($zone_id)
{
    global $zones;
    $zname = 'Unknown zone';
    if (isset($zones[$zone_id])) {
        $zname = $zones[$zone_id];
    }
    return $zname;
}

function test_realm()
{
    //return true; //always run
    global $server, $port;
    $s = @fsockopen("$server", $port, $ERROR_NO, $ERROR_STR, (float)0.5);
    if ($s) {
        @fclose($s);
        return true;
    } else {
        return false;
    }
}
