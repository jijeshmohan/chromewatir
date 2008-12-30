module ChromeWatir
  class Radio < WebElement
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