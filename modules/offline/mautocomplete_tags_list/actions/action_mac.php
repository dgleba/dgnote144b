<?php

require_once "configphp.dbc";
$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die('Error connecting to mysql');
mysql_select_db($dbname);
$return_arr = array();

/* If connection to database, run sql statement. */
if ($conn) {
    $fetch = mysql_query("SELECT * FROM nte_tags where tags_list like '%" . mysql_real_escape_string($_GET['term']) . "%'");

    /* Retrieve and store in array the results of the query. */
    while ($row = mysql_fetch_array($fetch, MYSQL_ASSOC)) {
        $row_array['id'] = $row['tags_id'];
        $row_array['value'] = $row['tags_list'];
        //$row_array['abbrev'] = $row['abbrev'];
        //
        
        if (!file_exists( $_SERVER['DOCUMENT_ROOT'].'/templates_c/tmp_log' )) {
           mkdir($_SERVER['DOCUMENT_ROOT'].'/templates_c/tmp_log', 0777, true);
        }
        
        //write log info
        //$app = Dataface_Application::getInstance();
        $handle = fopen("tmp_log_actionmac.txt", 'w');
        fwrite($handle, "action_mac" . PHP_EOL);
        fwrite($handle, dirname(__FILE__) . ' ' . PHP_EOL);
        fwrite($handle, $_SERVER['DOCUMENT_ROOT'] . ' ' . PHP_EOL);
        fwrite($handle,  substr(dirname(__FILE__),strlen($_SERVER['DOCUMENT_ROOT'])) . ' ' . PHP_EOL);
        //fwrite($handle, 'dfsitepath' .  DATAFACE_SITE_PATH . PHP_EOL);
        fclose($handle);


        array_push($return_arr, $row_array);
    }
}

/* Free connection resources. */
//mysql_close($conn);

/* Toss back results as json encoded array. */
echo json_encode($return_arr);
