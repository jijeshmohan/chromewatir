module ChromeWatir
  class Launcher
    include Exceptions
    def find_binary_path
      @chrome_path = nil
      case Config::CONFIG["host_os"]
        when /win32/
          if ENV["PATH"].nil
            raise BinaryNotFoundException.new("Chrome binary is not found in the default path or the path provided. Please provide the corrent path.") 
          end
          ENV["PATH"].split(";").each do |path|
            if(path.include?("\\Google\\Chrome\\Application"))
              @chrome_path = path + "\\chrome.exe"
            end
          end
        end
      return @chrome_path
    end
    def start(url,start_path = nil)
      start_path ||= find_binary_path
      raise BinaryNotFoundException.new("Chrome binary is not found in the default path or the path provided. Please provide the corrent path.") unless FileTest.exist? start_path
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
