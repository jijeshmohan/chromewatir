module ChromeWatir

#base class for check box and radio button
  class InputOptionElement < InputElement    
    #set checkbox/radio
    def set
      assert_enabled
      @container.js_eval("element.checked = true")
      @container.read_socket
    end
    #clear checkbox/radio
    def clear
      assert_enabled
      @container.js_eval("element.checked = false")
      @container.read_socket
    end
    #return true if checkbox/radio checked
    def checked?
      assert_exist
      @container.js_eval("element.checked")
      value = @container.read_socket
      if value.eql? "true"
        return true
      end
      if value.eql? "false"
        return false
      end
    end    
  end
end