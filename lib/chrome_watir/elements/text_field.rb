module ChromeWatir
  class TextField < WebElement
    def set(text)
      locate
      @container.js_eval("element.value = '#{text}'")
      return @container.read_socket
    end
    def clear
      locate
      @container.js_eval("element.value = ''")
      return @container.read_socket
    end
    def value
      locate
      @container.js_eval("element.value")
      return @container.read_socket
    end
  end
end