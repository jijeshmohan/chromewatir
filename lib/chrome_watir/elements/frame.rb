module ChromeWatir
  class Frame < WebElement
    include Container
    def locate
      super
      @container.js_eval("element = element.contentDocument;")
    end
  end
end