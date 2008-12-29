module ChromeWatir
  class WebElement
    @@driver_elements = nil
    def initialize(container,how,what)
      @container = container
      @how = how
      @what = what
    end
    def locate
      case @how
        when :id
          @container.js_eval("var element = document.getElementById('#{@what}');")
        when :name
          @container.js_eval("var element = document.getElementsByName('#{@what}')[0];")
        when :link_text
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
        when :xpath
          script = "var element = document.evaluate(\"#{@what}\", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;"
          @container.js_eval(script)
        when :value
          script = <<-EOF
          var foundElement = false;
          for (var i = 0; i < document.getElementsByTagName("INPUT").length; i++) {
            var element = document.getElementsByTagName("INPUT")[i];
            if (element.value == '#{@what}') {
              foundElement = true;
              break;
            }
          }
          EOF
      end
    end
    def click
      locate
      script = <<-EOS
      if (element["click"]){
        element.click();
      }
      var event = document.createEvent("MouseEvents");
      event.initMouseEvent("click", true, true, null, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
      element.dispatchEvent(event)
      EOS
      @container.js_eval(script)
    end
  end
end