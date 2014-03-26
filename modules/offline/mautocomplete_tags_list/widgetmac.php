<?php
class Dataface_FormTool_mautocomplete_tags_list {
        
     function buildWidget($record, &$field, $form, $formFieldName, $new=false){
                
       $factory = Dataface_FormTool::factory();
			 $widget =& $field['widget'];
			
			 $atts = array(
                'class' => 'xf-mautocomplete_tags_list'
            );

            $el = $factory->addElement('text', $formFieldName, $widget['label'], $atts);
            
            return $el;
        }
}
