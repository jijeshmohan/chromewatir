module ChromeWatir
#This class is the chrome-watir representation of a select list 
  class SelectList < InputElement
    ELEMENT_TYPE = "select"
    
    #This method clears the selected items in the select box
    def clear_selection
      assert_enabled
      script = <<-EOS
      var clearSel = function() {
        for(i=0; i < element.length; i++)
          {
               element.options[i].selected = false;
          }
        }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("clearSel()")
      @container.read_socket
      
    end
    
    #Returns all the items in the select list as an array. An empty array is returned if the select box has no contents. Raises UnknownObjectException if the select box is not found 
    def get_all_contents
      assert_exist
      script = <<-EOS
      var getAll= function() {
          var data="";
        for(i=0; i < element.length; i++)
          {
              data = data + element.options[i].text + ","
          }
          return data;
        }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("getAll()")
      return  @container.read_socket.strip().split(",")
      
    end
    
    #Returns the selected items as an array. Raises UnknownObjectException if the select box is not found. 
    def get_selected_items
      assert_exist
      script = <<-EOS
      var getSel = function() {
          var data="";
        for(i=0; i < element.length; i++)
          {
            if(element.options[i].selected)
              data = data + element.options[i].text + ","
          }
          return data;
        }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("getSel()")
      return  @container.read_socket.strip().split(",")
      
    end
    
    #Is the specified option (text) selected? 
    def selected? text
      get_selected_items.include? text
    end
    
    #Does the SelectList include the specified option (text)? 
    def includes? text
      get_all_contents.include? text
    end
    
    

#Selects an item, or items in a select box, by value. Raises NoValueFoundException if the specified value is not found.
 #* item   - the value of the thing to select, string
 def select_value value
      select_item_value "value",value
    end
 
#This method selects an item, or items in a select box, by text. Raises NoValueFoundException if the specified value is not found.
 #* item   - the thing to select, string 
    def select item
      select_item_value "text",item
    end
    
    def type
      assert_exist
      @container.js_eval("element.type")
      return @container.read_socket
    end
    
  private
    def select_item_value type, value
      assert_enabled
      script = <<-EOS
      var getSel  = function() {
      var found= false;
      for(i=0; i < element.length; i++)
          {
            if(element.options[i].#{type}== '#{value}' )
            {
             
                  element.options[i].selected=true;
                   found = true;
                 break;
            }
          }
          if(found)
          {
              return true;
          }
          else
          {
              return false;
          }
        }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("getSel();")
       exist= @container.read_socket.strip
       raise NoValueFoundException.new("Unable to find #{type}: #{value}") if exist.eql? "false"
    end
  end
end