module ChromeWatir
  class ElementCollections
    include Enumerable
    def initialize(container)
      @container = container
    end
    def length
      if @container.is_a?(Browser)
          @container.js_eval("var element = document;")
      else
        @container.locate
      end       
      if(defined? input_types)
        js_input_types = "("
        self.input_types.each do |item|
          js_input_types = js_input_types +'"' + item + '",'
        end
        js_input_types = js_input_types.chop + ")"
        
        type = self.element_type
        element_type = [type] unless type.is_a? Array 
        
        js_element_types = "("
        element_type.each do |item|
          js_element_types = js_element_types +'"' + item + '",'
        end
        js_element_types = js_element_types.chop + ")"                
        
        script = <<-EOF
         var element_length = function() {
         var foundElement = false;
         var selected_elements = [];
         var elements = [];
         var element_types = new Array#{js_element_types};
         var input_types = new Array#{js_input_types};
         
         var indexCount=0;
         elements = element.getElementsByTagName("*");
          
          for (var i=0; i<elements.length;i++)
          {
            for(var k=0;k<element_types.length;k++)
            {
              if(elements[i].tagName.toUpperCase()==element_types[k].toUpperCase())
              {
                if(elements[i].tagName.toUpperCase()=="BUTTON")
                {
                  indexCount=indexCount+1;
                }
                else
                {
                  for (var j=0; j<input_types.length;j++)
                  {
                    if(elements[i].getAttribute('type') == input_types[j])
                    {
                      indexCount=indexCount+1;
                    }
                  } 
                }
              }
            }
          }
          return indexCount;
        }
        EOF
      else
        type = self.element_type
        element_type = [type] unless type.is_a? Array         
        js_element_types = "("
        element_type.each do |item|
          js_element_types = js_element_types +'"' + item + '",'
        end
        js_element_types = js_element_types.chop + ")"                

        script = <<-EOF
          var element_length = function() {
          var foundElement = false;
          var elements = null;
          var element_types = new Array#{js_element_types};
          var indexCount=0;
          for(var i=0; i<element_types.length; i++)
          {
            filtered_elements = element.getElementsByTagName(element_types[i]);
              indexCount=indexCount+filtered_elements.length;
          }
          return indexCount;          
        }
        EOF
      end
      @container.js_eval(script)
      @container.read_socket      
      @container.js_eval("element_length()")
      length = @container.read_socket.to_i
      return length
    end
    # iterate through each of the elements in the collection in turn
    def each
      0.upto(self.length - 1) { |i| yield iterator_object(i) }
    end
    
    # allows access to a specific item in the collection
    def [](n)
      return iterator_object(n-1)
    end
    
    # this method creates an object of the correct type that the iterators use
    private
    def iterator_object(i)
      element_class.new(@container, :index, i + 1)
    end    
  end
  # this class accesses the links in the document as a collection
  # Normally a user would not need to create this object as it is returned by the Schnell::Container#links method  
  class Links < ElementCollections
    def element_class; Link; end
    def element_type; "a"; end
  end
  
  # this class accesses the images in the document as a collection
  # Normally a user would not need to create this object as it is returned by the Schnell::Container#images method  
  class Images < ElementCollections
    def element_class; Image; end
    def element_type; "img"; end
  end

  # this class accesses the text fields in the document as a collection
  # Normally a user would not need to create this object as it is returned by the Schnell::Container#text_fields method    
  class TextFields < ElementCollections
    def element_class; TextField; end
    def element_type; "input"; end
    def input_types; ["text","password"]; end
  end
  
  # this class accesses the checkboxes in the document as a collection
  # Normally a user would not need to create this object as it is returned by the Schnell::Container#check_boxes method    
  class CheckBoxes < ElementCollections
    def element_class; CheckBox; end
    def element_type; "input"; end
    def input_types; ["checkbox"]; end    
  end
  
  # this class accesses the radio buttons in the document as a collection
  # Normally a user would not need to create this object as it is returned by the Schnell::Container#radios method    
  class Radios < ElementCollections
    def element_class; Radio; end
    def element_type; "input"; end
    def input_types; ["radio"]; end    
  end
  
  # this class accesses the select lists in the document as a collection
  # Normally a user would not need to create this object as it is returned by the Schnell::Container#select_lists method    
  class SelectLists < ElementCollections
    def element_class; SelectList; end
    def element_type; "select"; end
  end
  
  # this class accesses the buttons in the document as a collection
  # Normally a user would not need to create this object as it is returned by the Schnell::Container#buttons method    
  class Buttons < ElementCollections
    def element_class; Button; end
    def element_type; ["input","button"]; end
    def input_types; ["button","image","submit"]; end        
  end  
end
