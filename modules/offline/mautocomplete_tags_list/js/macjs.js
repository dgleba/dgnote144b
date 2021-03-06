(function(){
  var $ = jQuery;
  
  registerXatafaceDecorator(function(node){
  
    function split(val) {
      return val.split(/,\s*/);
    }
    
    function extractLast(term) {
      return split(term).pop();
    }
    
    $(".xf-mautocomplete_tags_list")
    
    .bind("keydown", function(event) {
    
      if (event.keyCode === $.ui.keyCode.TAB &&
        $(this).data("ui-autocomplete").menu.active) {
        event.preventDefault();
      }
    })
    
    .autocomplete({
    
      source: function(request, response) {
	  
        $.getJSON("modules/mautocomplete_tags_list/actions/action_mac.php", {
          term: extractLast(request.term)
        }, response);
      },
	  
      search: function() {
	  
        var term = extractLast(this.value);
	    
        if (term.length < 1) {
          return false;
        }
      },
	  
      focus: function() {
        return false;
      },
	  
      select: function(event, ui) {
        var terms = split(this.value);
        terms.pop();
        terms.push(ui.item.value);
        terms.push("");
        this.value = terms.join(", ");
        return false;
      }
    });
  });
})();