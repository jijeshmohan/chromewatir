module ChromeWatir
#This is the base class for text field and text area
  class TextElement < InputElement
    
    #Sets the contents of the text box to the specified text value 
    def set(text)
      assert_enabled
      @container.js_eval("element.value = '#{text}'")
      return @container.read_socket
    end
    
    #Clears the contents of the text box. 
    def clear
      assert_enabled
      @container.js_eval("element.value = ''")
      return @container.read_socket
    end
    
    #returns the value of the text field directly.
    def value
      assert_exist
      @container.js_eval("element.value")
      value = @container.read_socket
      @container.release_container
      return value
    end
    
    #Appends the specified string value to the contents of the text box. 
    def append(text)
      assert_enabled
      @container.js_eval("var value = element.value")
      @container.js_eval("element.value = value + '#{text}'")
    end
    
    #Returns true if the text field contents is matches the specified target, which can be either a string
    def verify_contains(text)
      assert_exist
      script = <<-EOS
      var contains = function(){
        var value = element.value;
        var index = value.indexOf("#{text}");
        if (index == -1) {
          return false;
        }
        return true;
      }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("contains()")
      contains = @container.read_socket
      if contains.eql? "true"
        return true
      end
      if contains.eql? "false"
        return false
      end
    end    
  end
end