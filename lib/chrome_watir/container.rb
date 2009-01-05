module ChromeWatir
  module Container
  include ChromeWatir::Exceptions
    @@command_to_run = ""
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
    def select_list(how,what)
      return SelectList.new(self,how,what)
    end
    def wait_for_page_to_load
      default_time_out = 2
      sleep_time = 0.2
      counter = default_time_out/sleep_time
      js_eval("document.readyState")
      value = read_socket
      until(value.eql? "complete")
        sleep(sleep_time)
        js_eval("document.readyState")
        value = read_socket
        
        #For timeout
        counter -= 1
        if counter < 0
          close
          raise TimeOutException.new("Navigation timed out.") 
        end
      end
    end     
    def js_eval(string)
      sleep(0.1)
      @@command_to_run = "print #{string}\r\n"
      Connection.get.write(@@command_to_run)
      Connection.get.flush
    end
    def read_socket
      sleep(0.1)
      last_run_command = @@command_to_run.strip
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
            counter = -1
            while(true)
              counter -= 1
              line = value_arr[counter]
              break unless line
              if line.include?(last_run_command)
                break
              end
            end
            value = ""
            for i in ((counter+1).. -2)
              value += value_arr[i].strip! + "\n"
            end
            value.strip! unless value.include?("v8(running)>")
            value.sub!("null","") if value.eql? "null"
            return value
        else
          return value
        end
       return ""
    end
  end
end