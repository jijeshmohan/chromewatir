module ChromeWatir
  class CheckBox < WebElement
    def set
      locate
      @container.js_eval("element.checked = true")
      @container.read_socket
    end
    def clear
      locate
      @container.js_eval("element.checked = false")
      @container.read_socket
    end
    def checked?
      locate
      @container.js_eval("element.checked")
      return @container.read_socket
    end
  end
end