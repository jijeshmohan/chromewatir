module ChromeWatir
  class WebElement
    include ChromeWatir::Exceptions
    
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
    def assert_exist
      locate
      script = <<-EOS
      var exist = function() {
        if (element) {
          return true;
        }
        else {
          return false;
        }
      }
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.js_eval("exist()")
      exist = @container.read_socket
      raise UnknownObjectException.new(ChromeWatir::Exceptions.message_for_unable_to_locate(@how, @what)) if exist.eql? "false"
    end
    def exist?
      begin
        assert_exist
      rescue
        return false
      end
      return true
    end
    def click
      assert_exist
      script = <<-EOS
      if (element["click"]){
        element.click();
      }
      var event = document.createEvent("MouseEvents");
      event.initMouseEvent("click", true, true, null, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
      element.dispatchEvent(event)
      EOS
      @container.js_eval(script)
      @container.read_socket
      @container.wait_for_page_to_load
    end
  end
end