module ChromeWatir
  module Container
    def text_field(how, what)
      return TextField.new(self, how,what)
    end
    def button(how,what)
      return Button.new(self, how,what)
    end
    def check_box(how,what)
      return CheckBox.new(self, how, what)
    end
    def radio(how,what)
      return Radio.new(self, how, what)
    end
    def link(how,what)
      return Link.new(self, how,what)
    end
    def image(how,what)
      return Image.new(self, how, what)
    end
    def wait_for_page_to_load
      js_eval("document.readyState")
      value = read_socket
      puts value
      until(value.eql? "complete")
        sleep(0.2)
        js_eval("document.readyState")
        value = read_socket
      end
    end     
    def js_eval(string)
      sleep(0.1)
      @command_to_run = "print #{string}\r\n"
      Connection.get.write(@command_to_run)
      Connection.get.flush
    end
    def read_socket
      sleep(0.2)
      connection = Connection.get
      size = 4096
      receive = true
      value = ""
      while(receive)
          data = connection.recv(size)
          if data.length < size
            receive=false
          end 
          value += data
      end
         value_arr=value.split("\n")
        if value_arr.length > 1
            value_arr=value_arr.find_all{ |x| x.strip != "" }
            value=value_arr[-2] 
            
            return value.strip unless value.include?("v8(running)>")
        else
          return value
        end
       return ""

    end
  end
end