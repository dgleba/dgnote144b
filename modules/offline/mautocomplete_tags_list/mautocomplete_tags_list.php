<?php
class modules_mautocomplete_tags_list{

  private $baseURL = null;

  public function getBaseURL(){
    if ( !isset($this->baseURL) ){
      $this->baseURL = Dataface_ModuleTool::getInstance()->getModuleURL(__FILE__);
    }
    return $this->baseURL;
  }

  public function __construct(){

  $app = Dataface_Application::getInstance();
	
	$app->addHeadContent('<script src="'.htmlspecialchars($this->getBaseURL().'/js/macjs.js').'"></script>');
	
	if ( !class_exists('Dataface_FormTool')){
      $app->registerEventListener('Dataface_FormTool::init', array($this, '_registerWidget'));
    }else{
      $this->_registerWidget(Dataface_FormTool::getInstance());
    }
  }
  
  public function _registerWidget(Dataface_FormTool $formTool){
    $formTool->registerWidgetHandler('mautocomplete_tags_list', dirname(__FILE__).'/widgetmac.php', 'Dataface_FormTool_mautocomplete_tags_list');
  }
}
