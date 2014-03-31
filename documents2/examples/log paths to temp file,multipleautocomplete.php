<?php
$working_dir = "modules/multipleautocomplete/actions";

if (strpos(dirname(__FILE__), "xataface") !== false)
{
  $working_dir = "../xataface/" . $working_dir;
}

 
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
$pathapp = $array[3];

////write log info
//$app = Dataface_Application::getInstance();
$handle = fopen("logs/tmp_log_modules_multipleautocomplete.txt", 'w');
fwrite($handle, "info.." . PHP_EOL);
fwrite($handle, "_file_= " . dirname(__FILE__) . ' ' . PHP_EOL);
fwrite($handle, "docroot= " . $_SERVER['DOCUMENT_ROOT'] . ' ' . PHP_EOL);
fwrite($handle, "substr= " . substr(dirname(__FILE__), strlen($_SERVER['DOCUMENT_ROOT'])) . ' ' . PHP_EOL);
fwrite($handle, "url= " . $cururl . ' ' . PHP_EOL);
fwrite($handle, "pathapp= " . $pathapp . ' ' . PHP_EOL);

fwrite($handle, "path0= " . $array[0] . ' ' . PHP_EOL);
fwrite($handle, "path1= " . $array[1] . ' ' . PHP_EOL);
fwrite($handle, "path2= " . $array[2] . ' ' . PHP_EOL);
fwrite($handle, "path3= " . $array[3] . ' ' . PHP_EOL);
fwrite($handle, "path4= " . $array[4] . ' ' . PHP_EOL);

fwrite($handle, "dfsitepath= " .  DATAFACE_SITE_PATH . PHP_EOL);
fwrite($handle, "dfsiteurl= " .  DATAFACE_SITE_URL . PHP_EOL);
fwrite($handle,  "dfurl= " .  DATAFACE_URL . PHP_EOL);

fclose($handle);


?>
<script>
var working_dir = <?php echo json_encode($working_dir); ?>;
</script>


 

<?php
class modules_multipleautocomplete
{
  private $baseURL = null;
  

  public function getBaseURL()
  {
    if (!isset($this->baseURL))
	{
      $this->baseURL = Dataface_ModuleTool::getInstance()->getModuleURL(__FILE__);
    }
    return $this->baseURL;
  }
  
  public function __construct()
  {
    $s = DIRECTORY_SEPARATOR;
    $app = Dataface_Application::getInstance();
	
	$app->addHeadContent('<script src="'.htmlspecialchars($this->getBaseURL().'/js/multipleautocomplete.js').'"></script>');
	
	if ( !class_exists('Dataface_FormTool'))
	{
      $app->registerEventListener('Dataface_FormTool::init', array($this, '_registerWidget'));
    }
	else
	{
      $this->_registerWidget(Dataface_FormTool::getInstance());
    }
  }
  
  public function _registerWidget(Dataface_FormTool $formTool)
  {
    $formTool->registerWidgetHandler('multipleautocomplete', dirname(__FILE__).'/multipleautocompletewidget.php', 'Dataface_FormTool_multipleautocomplete');
  }
}
