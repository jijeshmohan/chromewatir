module ChromeWatir
  class TextField < InputElement
    ELEMENT_TYPE = "input"
    INPUT_TYPE = ["text","password"]    
    def set(text)
      assert_enabled
      @container.js_eval("element.value = '#{text}'")
      return @container.read_socket
    end
    def clear
      assert_enabled
      @container.js_eval("element.value = ''")
      return @container.read_socket
    end
    def value
      assert_exist
      @container.js_eval("element.value")
      return @container.read_socket
    end
  end
end