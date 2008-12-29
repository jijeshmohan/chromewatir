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
  end
end