<?php
//require_once "C:\\p2\\xampp\\htdocs\\xataface\\dataface-public-api.php";
//df_init("C:\\p2\\xampp\\htdocs\\dgnote144b\\xataface");
//$app = & Dataface_Application::getInstance();
//$app->display();

function curPageURL() {
$isHTTPS = (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on");
$port = (isset($_SERVER["SERVER_PORT"]) && ((!$isHTTPS && $_SERVER["SERVER_PORT"] != "80") || ($isHTTPS && $_SERVER["SERVER_PORT"] != "443")));
$port = ($port) ? ':'.$_SERVER["SERVER_PORT"] : '';
$url = ($isHTTPS ? 'https://' : 'http://').$_SERVER["SERVER_NAME"].$port.$_SERVER["REQUEST_URI"];
return $url;
}

$cururl = curPageURL();

$array = explode('/',$cururl);
$count = count($array);
$path1 = $array[3];

////write log info
//$app = Dataface_Application::getInstance();
$handle = fopen("tmp_log_actionmac.txt", 'w');
fwrite($handle, "action_mac" . PHP_EOL);
fwrite($handle, "_file_= " . dirname(__FILE__) . ' ' . PHP_EOL);
fwrite($handle, "docroot= " . $_SERVER['DOCUMENT_ROOT'] . ' ' . PHP_EOL);
fwrite($handle, "substr= " . substr(dirname(__FILE__), strlen($_SERVER['DOCUMENT_ROOT'])) . ' ' . PHP_EOL);
fwrite($handle, "url= " . $cururl . ' ' . PHP_EOL);
fwrite($handle, "path1= " . $path1 . ' ' . PHP_EOL);

//fwrite($handle, "dfsitepath" .  DATAFACE_SITE_PATH . PHP_EOL);
//fwrite($handle,   DATAFACE_SITE_PATH );
fclose($handle);



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



echo json_encode($return_arr);
