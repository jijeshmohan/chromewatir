module ChromeWatir
  class Link < WebElement
    def text
      assert_exist
      @container.js_eval("element.innerText")
      return @container.read_socket
    end
    
  end
end
