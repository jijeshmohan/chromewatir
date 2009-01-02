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
  end
end
