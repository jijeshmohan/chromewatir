module ChromeWatir
  #This class a chrome-watir representation of frame and iframe
  class Frame < WebElement
    include Container
    ELEMENT_TYPE=['frame','iframe']
    def locate
      super
      @container.js_eval("element = element.contentDocument;")
    end
  end
end
