module ChromeWatir
  class FileField < InputElement
    include ChromeWatir::Exceptions
    INPUT_TYPES = ["file"]
    # set the file location in the Choose file dialog in a new process
    # will raise a Watir Exception if AutoIt is not correctly installed
    def set(set_path)
      assert_enabled
      set_path.gsub!("/","\\")

      AutoIt.check_is_installed
      begin
        thrd = Thread.new do
          set_file_field = <<-EOS
          rubyw -e \"require 'win32ole';
          @autoit=WIN32OLE.new('AutoItX3.Control');
          waitresult=@autoit.WinWait 'Open', '', 15;
          sleep 1;
          if waitresult == 1 then
            @autoit.ControlSetText 'Open', '', 'Edit1', '#{set_path}';
            @autoit.ControlSend 'Open', '', 'Button2', '{ENTER}';
          end
          EOS
          system(set_file_field)
        end
        thrd.join(1)
      rescue
        raise ChromeWatir::Exceptions::ChromeException, "Problem accessing Choose file dialog"
      end
      click
    end
  end
end