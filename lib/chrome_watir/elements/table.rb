module ChromeWatir
  #This class is the chrome-watir representation of div element
  class Table < WebElement
    include Container
    include Enumerable
     ELEMENT_TYPE = "table"
     
    def row_count
      assert_exist
      @container.js_eval('element.getElementsByTagName("TR").length;')
      return  @container.read_socket.to_i
    end

    def length
      self.row_count
    end

    def each
      0.upto(self.length - 1) { |i| yield iterator_object(i) }
    end
    
    def [](index)
      assert_exist
      return iterator_object(index-1)
    end

    def column_count(index=1)
      assert_exist
      iterator_object(index-1).column_count
    end

    private
    def iterator_object(i)
      TableRow.new(self, :index, i + 1)
    end    
  end

  #This class is the chrome-watir representation of table row element
  class TableRow < WebElement
    include Container
    include Enumerable
     ELEMENT_TYPE = "tr"
    def length
      self.column_count
    end
    def column_count(index=1)
      assert_exist
      @container.js_eval('element.getElementsByTagName("TD").length;')
      return  @container.read_socket.to_i
    end
    def each
      0.upto(self.length - 1) { |i| yield iterator_object(i) }
    end
    
    def [](index)
      assert_exist
      return iterator_object(index-1)
    end
    private
    def iterator_object(i)
      TableCell.new(self, :index, i + 1)
    end    
  end
  #This class is the chrome-watir representation of table cell element
  class TableCell < WebElement
    include Container
     ELEMENT_TYPE = "td"
  end
end

