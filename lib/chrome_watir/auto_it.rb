require "win32ole"
module ChromeWatir
  class AutoIt
    include ChromeWatir::Exceptions
    @@autoit = nil  

    def self.get_instance
      unless @@autoit
        begin
          @@autoit = WIN32OLE.new('AutoItX3.Control')
        rescue WIN32OLERuntimeError
          _register('AutoItX3.dll')
          @@autoit = WIN32OLE.new('AutoItX3.Control')
        end
      end
      @@autoit
    end
    
    def self._register(dll)
      vendor_path = File.dirname(__FILE__) + "/../../vendor"
      system("regsvr32.exe /s "    + "#{vendor_path}/auto_it/#{dll}".gsub('/', '\\'))
    end
    def self._unregister(dll)
      system("regsvr32.exe /s /u " + "#{vendor_path}/auto_it/#{dll}".gsub('/', '\\'))
    end
    def self.check_is_installed
      begin
        AutoIt.get_instance
      rescue
          raise ChromeWatir::Exceptions::ChromeException, "The AutoIt dll must be correctly registered for this feature to work properly"
      end
    end
  end    
end