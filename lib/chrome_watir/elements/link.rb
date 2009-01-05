module ChromeWatir
  class Link < WebElement
    def locate
      case @how
        when :text
          script = <<-EOF
          var foundElement = false;
          for (var i = 0; i < document.links.length; i++) {
            var element = document.links[i];
            if (element.text == '#{@what}') {
              foundElement = true;
              break;
            }
          }
          EOF
          @container.js_eval(script)
        else
          super()
      end
    end
    
    def has_image?
      exist?
      script = <<-EOS
      var hasImg  = function() {
        if (element.getElementsByTagName("IMG").length > 0 )
          return true;
        else
          return false;
        }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("hasImg();")
      return @container.read_socket.strip.include?("true")
    end
 
    def src
      exist?
      script = <<-EOS
      var imgSrc = function() {
        if (element.getElementsByTagName("IMG").length > 0 )
          return element.getElementsByTagName("IMG")[0].src;
        else
          return "";
        }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("imgSrc();")
      return @container.read_socket
    end
 
end
end
