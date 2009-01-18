module ChromeWatir

#A Factory class for javascripts
  class LocatorFactory
     class << self
       def get_locate_js element,how,what
         script=""
          case how
            when :index
              if(defined? element.class::INPUT_TYPES)
                js_input_types = "("
                element.class::INPUT_TYPES.each do |item|
                  js_input_types = js_input_types +'"' + item + '",'
                end
                js_input_types = js_input_types.chop + ")"
                
                element_type = element.class::ELEMENT_TYPE
                element_type = [element_type] unless element_type.is_a? Array 
                js_element_types = "("
                element_type.each do |item|
                  js_element_types = js_element_types +'"' + item + '",'
                end
                js_element_types = js_element_types.chop + ")"                
                
                script = <<-EOF
                var foundElement = false;
                var selected_elements = [];
                var elements = [];
                var element_types = new Array#{js_element_types};
                var input_types = new Array#{js_input_types};
               
               var indexCont=0;
               elements = element.childNodes;
                
                for (var i=0; i<elements.length;i++)
                {
                  if(foundElement==true)
                  {
                    break;
                  }
                
                  for(var k=0;k<element_types.length;k++)
                  {
                  
                       if(foundElement==true)
                      {
                        break;
                      }
                  
                    if(element[i].tagName.toUpperCase()==element_types[k].toUpperCase())
                    {
                          if(element[i].tagName.toUpperCase()=="BUTTON")
                          {
                              indexCont=indexCont+1;
                                if(indexCount==#{what})
                                {
                                    element=elements[i];
                                    foundElement=true;
                                    break;
                                }
                          
                          }
                          else
                          {
                                  for (var j=0; j<input_types.length;j++)
                                  {
                                    if(elements[i].getAttribute('type') == input_types[j])
                                    {
                                        indexCont=indexCont+1;
                                        if(indexCount==#{what})
                                        {
                                            element=elements[i];
                                            foundElement=true;
                                            break;
                                        }
                                    }
                             
                                  }
                          }
                    }
                  }
                     
                }
             
                EOF
                puts script
              else
                element_type = element.class::ELEMENT_TYPE
                element_type = [element_type] unless element_type.is_a? Array 
                js_element_types = "("
                element_type.each do |item|
                  js_element_types = js_element_types +'"' + item + '",'
                end
                js_element_types = js_element_types.chop + ")"                

                script = <<-EOF
                var foundElement = false;
                var elements = [];
                var element_types = new Array#{js_element_types};
                for(var i=0; i<element_types.length; i++)
                {
                  filtered_elements = element.getElementsByTagName(element_types[i]);
                  for(var j=0; j<filtered_elements.length; j++)
                  {
                    elements.push(filtered_elements[j]);
                  }
                }              
                element = elements[#{what - 1}];
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
              if(defined? element.class::INPUT_TYPES)
                js_input_types = "("
                element.class::INPUT_TYPES.each do |item|
                  js_input_types = js_input_types +'"' + item + '",'
                end
                js_input_types = js_input_types.chop + ")"

                element_type = element.class::ELEMENT_TYPE
                element_type = [element_type] unless element_type.is_a? Array 
                js_element_types = "("
                element_type.each do |item|
                  js_element_types = js_element_types +'"' + item + '",'
                end
                js_element_types = js_element_types.chop + ")"
                
                script = <<-EOF
                var foundElement = false;
                var elements = [];
                var selected_element = null;
                var input_types = new Array#{js_input_types};
                var element_types = new Array#{js_element_types};
                for(var i=0; i<element_types.length; i++)
                {
                  filtered_elements = element.getElementsByTagName(element_types[i]);
                  for(var j=0; j<filtered_elements.length; j++)
                  {
                    elements.push(filtered_elements[j]);
                  }
                }
                for (var i=0; i<elements.length;i++)
                {
                  if(foundElement)
                    {
                      break;
                    }
                    if(elements[i].tagName.toUpperCase()=="BUTTON" && elements[i].getAttribute("#{how.to_s}") == "#{what}")
                    {
                        selected_element=elements[i];
                        foundElement = true;
                        break;
                    
                    }
                  for (var j=0; j<input_types.length;j++)
                  {
                    if(elements[i].getAttribute('type') == input_types[j] && elements[i].getAttribute("#{how.to_s}") == "#{what}")
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
              js_element_types = "("
              element_type.each do |item|
                js_element_types = js_element_types +'"' + item + '",'
              end
              js_element_types = js_element_types.chop + ")"
              script = <<-EOF
                var foundElement = false;
                var selected_element = null;
                var element_types = new Array#{js_element_types};
                 for (var j=0; j<element_types.length;j++)
                {
                    if(foundElement)
                    {
                      break;
                    }
                      var elements = element.getElementsByTagName(element_types[j]);
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
