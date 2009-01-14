module ChromeWatir
  class Browser
    include Container
    def initialize(chrome_path = nil)
      @chrome_path = chrome_path
    end
    
    # Navigate to the specified URL. 
    def goto(url)
      Connection.close
      @pid = Launcher.new.start(url,@chrome_path)
      read_socket
      wait_for_page_to_load
      release_container
    end
    
    # returns the current url, as displayed in the address bar of the browser 
    def url
      js_eval("document.URL")
      return read_socket
    end
    
    #returns the title of the page
    def title
      js_eval("document.title")
      return read_socket
    end
    
    #Go to the previous page - the same as clicking the browsers back button.
    def back
      js_eval("history.back()")
      wait_for_page_to_load
    end
    
    #Go to the next page - the same as clicking the browsers forward button
    def forward
      js_eval("history.forward()")
      wait_for_page_to_load
    end
    
    #close the browser
    def close
      sleep(0.5)
      Process.kill(5,@pid)
      Connection.close
    end
  end
end