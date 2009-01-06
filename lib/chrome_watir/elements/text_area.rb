module ChromeWatir
  class TextArea < InputElement
    ELEMENT_TYPE = "textarea"
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
    def append(text)
      assert_exist
      @container.js_eval("var value = element.value")
      @container.js_eval("element.value = value + '#{text}'")
    end
  end
end