module ChromeWatir
  class TextField < WebElement
    def set(text)
      assert_exist
      @container.js_eval("element.value = '#{text}'")
      return @container.read_socket
    end
    def clear
      assert_exist
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