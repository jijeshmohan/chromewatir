
module ChromeWatir
#This class is the chrome-watir representation of an image
  class Image < WebElement
    ELEMENT_TYPE = "img"
    def locate
      case @how
        when :alt
          script = <<-EOF
          var foundElement = false;
          for (var i = 0; i < document.images.length; i++) {
            var element = document.images[i];
            if (element.alt== '#{@what}') {
              foundElement = true;
              break;
            }
          }
          EOF
          @container.js_eval(script)
        when :src
          script = <<-EOF
          var foundElement = false;
          for (var i = 0; i < document.images.length; i++) {
            var element = document.images[i];
            if (element.src== '#{@what}') {
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
    def_wrap_guard :src
    def_wrap_guard :alt
  end
end
