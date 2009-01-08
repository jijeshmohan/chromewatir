module ChromeWatir
#This class is the chrome-watir representation of a text_field 
  class TextField < TextElement
    ELEMENT_TYPE = "input"
    INPUT_TYPE = ["text","password"]    
  end
end