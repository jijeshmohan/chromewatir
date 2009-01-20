
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
          var element1=null;
          for (var i = 0; i < element.images.length; i++) {
            element1 = element.images[i];
            if (element1.alt== '#{@what}') {
              foundElement = true;
              break;
            }
          }
          element=element1;
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
          var element1=null;
          for (var i = 0; i < element.images.length; i++) {
            element1 = element.images[i];
            if (element1.src.indexOf("#{@what}") > 0 ) {
              foundElement = true;
              break;
            }
          }
          element=element1;
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
