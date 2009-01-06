module ChromeWatir
  class Browser
    include Container
    def initialize(chrome_path = nil)
      @chrome_path = chrome_path
    end
    def goto(url)
      Connection.close
      @pid = Launcher.new.start(url,@chrome_path)
      read_socket
      wait_for_page_to_load
    end
    def url
      js_eval("document.URL")
      return read_socket
    end
    def title
      js_eval("document.title")
      return read_socket
    end
    def back
      js_eval("history.back()")
      wait_for_page_to_load
      read_socket
    end
    def forward
      js_eval("history.forward()")
      wait_for_page_to_load
      read_socket
    end
    def page_source
      js_eval("document.body.innerHTML")
      return read_socket
    end
    def close
      sleep(0.5)
      Process.kill(5,@pid)
      Connection.close
    end
  end
end