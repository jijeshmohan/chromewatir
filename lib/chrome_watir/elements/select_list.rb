module ChromeWatir
  class SelectList < InputElement
    ELEMENT_TYPE = "select"
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
    
    def selected? text
      get_selected_items.include? text
    end
    def includes? text
      get_all_contents.include? text
    end
    def select_value value
      assert_enabled
      script = <<-EOS
      var getVal = function() {
      for(i=0; i < element.length; i++)
          {
            if(element.options[i].value == '#{value}' )
            {
             
                  element.options[i].selected=true;
              
            }
          }
          
        }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("getVal();")
     @container.read_socket
    end
    def select item
      assert_enabled
      script = <<-EOS
      var getSel  = function() {
      for(i=0; i < element.length; i++)
          {
            if(element.options[i].text == '#{item}' )
            {
             
                  element.options[i].selected=true;
              
            }
          }
          
        }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("getSel();")
      @container.read_socket
    end
    def type
      assert_exist
      @container.js_eval("element.type")
      return @container.read_socket
    end
  end
end