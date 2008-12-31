module ChromeWatir
  class CheckBox < WebElement
    def set
      assert_exist
      @container.js_eval("element.checked = true")
      @container.read_socket
    end
    def clear
      assert_exist
      @container.js_eval("element.checked = false")
      @container.read_socket
    end
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