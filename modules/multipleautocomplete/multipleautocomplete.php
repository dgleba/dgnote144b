<?php
$paths = parse_ini_file(DATAFACE_SITE_PATH."/paths.ini");
setcookie("app_path", DATAFACE_SITE_PATH, 0, '/');
?>
<script>
var working_dir = <?php echo json_encode($paths['action_path']); ?>;
</script>
<?php

//http://stackoverflow.com/questions/11072763/get-folder-name-of-current-directory
//Notice: Undefined index: PATH_INFO in C:\p2\xampp\htdocs\dgnote144b\modules\multipleautocomplete\multipleautocomplete.php on line 11  
//Notice: Undefined index: dirname in C:\p2\xampp\htdocs\dgnote144b\modules\multipleautocomplete\multipleautocomplete.php on line 12
//$path_parts = pathinfo($_SERVER["PATH_INFO"]);
//$dir1 = $path_parts["dirname"];

//write log info
//$app = Dataface_Application::getInstance();
$handle = fopen("tmp_log_mac1.txt", 'w');
fwrite($handle, "action_mac" . PHP_EOL);
fwrite($handle, dirname(__FILE__) . ' ' . PHP_EOL);
fwrite($handle, $_SERVER['DOCUMENT_ROOT'] . ' ' . PHP_EOL);
fwrite($handle, substr(dirname(__FILE__), strlen($_SERVER['DOCUMENT_ROOT'])) . ' ' . PHP_EOL);
//fwrite($handle, "dfsitepath" .  DATAFACE_SITE_PATH . PHP_EOL);
fwrite($handle,   DATAFACE_SITE_PATH );
fclose($handle);


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
