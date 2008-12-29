module ChromeWatir
  class Launcher
    include Exceptions
    def find_binary_path
      case Config::CONFIG["host_os"]
        when /win32/
#          @chrome_path = ENV["HOMEDRIVE"] + ENV["HOMEPATH"] + "\\Local Settings\\Application Data\\Google\\Chrome\\Application\\chrome.exe"
           @chrome_path = "C:\\Documents and Settings\\saisanv\\Local Settings\\Application Data\\Google\\Chrome\\Application\\chrome.exe"
        end
      return @chrome_path
    end
    def start(url,start_path = nil)
      start_path ||= find_binary_path
      raise BinaryNotFoundException.new("Chrome not found. Please provide the corrent path.") unless FileTest.exist? start_path
      process_id = Process.create(
                           :app_name         => "#{start_path} --remote-shell-port=12345 \"#{url}\"",
                           :creation_flags   => Process::DETACHED_PROCESS,
                           :process_inherit  => false,
                           :thread_inherit   => true,
                           :inherit          => true
                           ).process_id
      return process_id
    end
  end
end