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
      assert_enabled
      @container.js_eval("var value = element.value")
      @container.js_eval("element.value = value + '#{text}'")
    end
    def verify_contains(text)
      assert_exist
      script = <<-EOS
      var contains = function(){
        var value = element.value;
        var index = value.indexOf("#{text}");
        if (index == -1) {
          return false;
        }
        return true;
      }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("contains()")
      contains = @container.read_socket
      if contains.eql? "true"
        return true
      end
      if contains.eql? "false"
        return false
      end
    end
  end
end