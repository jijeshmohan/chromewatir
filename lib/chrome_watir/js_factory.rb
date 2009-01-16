module ChromeWatir

#A Factory class for javascripts
  class JsFactory
     class << self
       def get_locate_js element,how,what
         script=""
          case how
            when :index
               if(defined? element.class::INPUT_TYPE)
                    strTypes = "("
                    element.class::INPUT_TYPE.each do |item|
                      strTypes = strTypes +'"' + item + '",'
                    end
                    strTypes = strTypes.chop + ")"
                    
                    script = <<-EOF
                    var foundElement = false;
                    var selected_elements = [];
                    var types = new Array#{strTypes};
                    var elements = element.getElementsByTagName("#{element.class::ELEMENT_TYPE}");
                    for (var i=0; i<elements.length;i++)
                    {
                      for (var j=0; j<types.length;j++)
                      {
                        if(elements[i].getAttribute('type') == types[j])
                        {
                            selected_elements.push(elements[i]);
                            foundElement=true;
                        }
                      }
                    }
                     element = selected_elements[#{what - 1}];
                    EOF
              else
                    script = <<-EOF
                    var foundElement = true;
                    element = element.getElementsByTagName("#{element.class::ELEMENT_TYPE}")[#{what - 1}];
                    EOF
              end
            when :value
                script =<<-EOF
                  var foundElement = false;
                  for (var i = 0; i < element.getElementsByTagName("INPUT").length; i++) {
                    var ele = element.getElementsByTagName("INPUT")[i];
                    if (ele.value == '#{what}') {
                      foundElement = true;
                      break;
                    }
                  }
                  element=ele;
                  EOF
            when :id,:name
                    if(defined? element.class::INPUT_TYPE)
                      strTypes = "("
                      element.class::INPUT_TYPE.each do |item|
                        strTypes = strTypes +'"' + item + '",'
                      end
                      strTypes = strTypes.chop + ")"
                      script = <<-EOF
                      var foundElement = false;
                      var selected_element = null;
                      var types = new Array#{strTypes};
                      var elements = element.getElementsByTagName("#{element.class::ELEMENT_TYPE}");
                      for (var i=0; i<elements.length;i++)
                      {
                        if(foundElement)
                          {
                            break;
                          }
                        for (var j=0; j<types.length;j++)
                        {
                          if(elements[i].getAttribute('type') == types[j] && elements[i].getAttribute("#{how.to_s}") == "#{what}")
                          {
                              selected_element=elements[i];
                              foundElement = true;
                              break;
                          }
                        }
                      }
                       element = selected_element;
                      EOF
                  else
                    element_type = element.class::ELEMENT_TYPE
                    element_type = [element_type] unless element_type.is_a? Array 
                    strTypes = "("
                    element_type.each do |item|
                      strTypes = strTypes +'"' + item + '",'
                    end
                    strTypes = strTypes.chop + ")"
                    script = <<-EOF
                      var foundElement = false;
                      var selected_element = null;
                      var types = new Array#{strTypes};
                       for (var j=0; j<types.length;j++)
                      {
                          if(foundElement)
                          {
                            break;
                          }
                            var elements = element.getElementsByTagName(types[j]);
                            for (var i=0; i<elements.length;i++)
                            {             
                                if(elements[i].getAttribute('#{how.to_s}') == "#{what}")
                                {
                                    selected_element=elements[i];
                                    foundElement=true;
                                    break;
                                }
                            }
                      }
                       element = selected_element;
                      EOF
                  end
          end
          script
       end
      end
  end
end
