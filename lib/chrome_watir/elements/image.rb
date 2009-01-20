
module ChromeWatir
#This class is the chrome-watir representation of an image
  class Image < WebElement
    ELEMENT_TYPE = "img"
    def locate
      case @how
        when :alt
          if @container.is_a?(Browser)
              @container.js_eval("var element = document;")
          else
            @container.locate
          end 
          script = <<-EOF
          var foundElement = false;
          var elements = element.getElementsByTagName('img');
          for (var i = 0; i < elements.length; i++) {
            if (elements[i].alt== '#{@what}') {
              foundElement = true;
              element=elements[i];
              break;
            }
          }
          
          EOF
          @container.js_eval(script)
        when :src
          if @container.is_a?(Browser)
              @container.js_eval("var element = document;")
          else
            @container.locate
          end 
          script = <<-EOF
          var foundElement = false;
          var elements = element.getElementsByTagName('img');
          for (var i = 0; i < elements.length; i++) {
            if (elements[i].src.indexOf("#{@what}") > 0 ) {
              foundElement = true;
              element=elements[i];
              break;
            }
          }
          EOF

          @container.js_eval(script)
        else
          super()
      end
    end
    def_wrap_guard :src
    def_wrap_guard :alt
  end
end
