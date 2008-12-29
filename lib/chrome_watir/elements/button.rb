module ChromeWatir
  class Button < WebElement
    def click
      locate
      @container.js_eval("element.click()")
      @container.read_socket
    end
  end
end