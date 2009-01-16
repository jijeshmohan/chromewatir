module ChromeWatir
  class Frame < WebElement
    include Container
    ELEMENT_TYPE=['frame','iframe']
    def locate
      super
      @container.js_eval("element = element.contentDocument;")
    end
  end
end