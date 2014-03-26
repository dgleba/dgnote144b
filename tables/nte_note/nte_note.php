<?php
class tables_nte_note {
    
    function getTitle(&$record) {
        return str_pad( mb_substr($record->val('note_fld'),0,35),35," ") ;
        //return str_pad( mb_substr($record->val('note_fld'),0,22),22,"_") . " -- ". $record->strval('updatedtime');
    }


 //end of class...     
}
