module ChromeWatir
  class Connection
    private_class_method :new
    @@connection = nil
    def Connection.get
      unless @@connection
        @@connection = TCPSocket::new("127.0.0.1","12345")
        @@connection.sync = true
        @@connection.write("debug()\r\n")
        @@connection.flush
      end
      @@connection
    end
    def Connection.close
      begin
      @@connection.shutdown if @@connection
      @@connection = nil
      rescue
        # forceful closing will trigger exception
      end
    end
  end
end
