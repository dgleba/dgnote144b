<?php
require_once "C:\\p2\\xampp\\htdocs\\xataface\\dataface-public-api.php";
df_init("C:\\p2\\xampp\\htdocs\\dgnote144b\\xataface");
$app = & Dataface_Application::getInstance();
$app->display();

$multipleautocomplete_field_name = $_COOKIE["field_name"];
$multipleautocomplete_table_name = $_COOKIE["table_name"];
$site_path = $_COOKIE["app_path"];

$multipleautocomplete_database = parse_ini_file($site_path."/config.dbc");

foreach ($multipleautocomplete_database as $key => $value)
{
  if ($key == 'host')
    $dbhost = $value;
  elseif ($key == 'user')
    $dbuser = $value;
  elseif ($key == 'password')
    $dbpass = $value;
  elseif ($key == 'name')
    $dbname = $value;
}

$conn = mysql_connect($dbhost, $dbuser, $dbpass) or die('Error connecting to mysql');
mysql_select_db($dbname);
$return_arr = array();

if ($conn)
{
  $fetch = mysql_query("SELECT * FROM ". $multipleautocomplete_table_name ." WHERE ". $multipleautocomplete_field_name ." like '%" . mysql_real_escape_string($_GET['term']) . "%'");

  while ($row = mysql_fetch_array($fetch, MYSQL_ASSOC))
  {
    $row_array['value'] = $row[$multipleautocomplete_field_name];
    array_push($return_arr, $row_array);
  }
}

//write log info
//$app = Dataface_Application::getInstance();
$handle = fopen("tmp_log_actionmac.txt", 'w');
fwrite($handle, "action_mac" . PHP_EOL);
fwrite($handle, dirname(__FILE__) . ' ' . PHP_EOL);
fwrite($handle, $_SERVER['DOCUMENT_ROOT'] . ' ' . PHP_EOL);
fwrite($handle, substr(dirname(__FILE__), strlen($_SERVER['DOCUMENT_ROOT'])) . ' ' . PHP_EOL);
//fwrite($handle, "dfsitepath" .  DATAFACE_SITE_PATH . PHP_EOL);
//fwrite($handle,   DATAFACE_SITE_PATH );
fclose($handle);

echo json_encode($return_arr);
