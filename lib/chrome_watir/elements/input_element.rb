module ChromeWatir
  class InputElement < WebElement
    ELEMENT_TYPE = "input"    
    def_wrap_guard :type
  end
end