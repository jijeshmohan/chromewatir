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
    def js_eval(string)
      sleep(0.3)
      @command_to_run = "print #{string}\r\n"
      Connection.get.write(@command_to_run)
      Connection.get.flush
    end
    def read_socket
      connection = Connection.get
      size = 4096
      grow_by = 1024
      receive = true
      value = ""
      socks = nil
      while(socks == nil)
        socks = Kernel.select([connection],nil,nil,1)
      end
      for stream in socks[0]
        data = stream.recv(size)
        while(receive)
          value += data
          size += grow_by
          if(value.include?("\r\nv8(running)> "))
            receive = false
            data = stream.recv(size)
          else
            data = stream.recv(size)
          end
        end
      end
      value += data if data
      return value
    end
  end
end