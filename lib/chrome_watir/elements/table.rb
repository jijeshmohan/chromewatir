module ChromeWatir
  #This class is the chrome-watir representation of Table element
  class Table < WebElement
    include Container
    include Enumerable
     ELEMENT_TYPE = "table"
    
     #Returns the number of rows inside the table, including rows in nested tables. 
    def row_count
      assert_exist
      @container.js_eval('element.getElementsByTagName("TR").length;')
      return  @container.read_socket.to_i
    end

    def length
      self.row_count
    end

    #iterates through the rows in the table. Yields a TableRow object 
    def each
      0.upto(self.length - 1) { |i| yield iterator_object(i) }
    end
    
    #Returns a row in the table
    #
    #  * index         - the index of the row
    def [](index)
      assert_exist
      return iterator_object(index-1)
    end

    #This method returns the number of columns in a row of the table. Raises an UnknownObjectException if the table doesn‘t exist.
    #
    #  * index         - the index of the row
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

