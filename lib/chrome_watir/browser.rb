module ChromeWatir
  class Browser
    include Container
    def initialize(chrome_path = nil)
      @chrome_path = chrome_path
    end
    def goto(url)
      Connection.close
      @pid = Launcher.new.start(url,@chrome_path)
      sleep(0.3)
    end
    def url
      js_eval("document.URL")
      return read_socket
    end
    def back
      js_eval("history.back()")
      read_socket
    end
    def forward
      js_eval("history.forward()")
      read_socket
    end
    def close
      sleep(0.5)
      Process.kill(5,@pid)
      Connection.close
    end
  end
end