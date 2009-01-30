module ChromeWatir
  #This class is the chrome-watir representation of div element
  class Table < WebElement
    include Container
     ELEMENT_TYPE = "table"
     
    def row_count
      assert_exist
      @container.js_eval('element.getElementsByTagName("TR").length;')
      return  @container.read_socket.to_i
    end
  end
end
