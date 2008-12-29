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
      @@connection = nil
    end
  end
end
