module ChromeWatir

=begin rdoc

This module contains the factory methods that are used to access most html objects

For example, to access a button on a web page that has the following html

 <input type = button name= 'b1' value='Click Me' onClick='javascript:doSomething()'>

the following watir code could be used

 browser.button(:name, 'b1').click

or

 browser.button(:value, 'Click Me').to_s

there are many methods available to the Button object

=end 
  module Container
    include ChromeWatir::Exceptions
    @@command_to_run = ""
    
    # This is the main method for accessing a text field. Usually an <input type = text> HTML tag. or a text area - a  <textarea> tag
    #  *  how   - symbol - how we access the field, :index, :id, :name etc
    #  *  what  - string, integer or regular expression - what we are looking for,
    #
    # returns a TextField object
    #
    # Typical Usage
    #
    #    browser.text_field(:id,   'user_name')                 # access the text field with an ID of user_name
    #    browser.text_field(:name, 'address')                   # access the text field with a name of address
    #    browser.text_field(:index, 2)                          # access the second text field on the page (1 based, so the first field is accessed with :index,1)
    #    browser.text_field(:xpath, "//textarea[@id='user_name']/")    # access the text field with an ID of user_name
    def text_field(how, what)
      return TextField.new(self, how,what)
    end
    
    # This is the main method for accessing a button. Often declared as an <input type = submit> tag.
    #  *  how   - symbol - how we access the button, :index, :id, :name etc
    #  *  what  - string, integer or regular expression - what we are looking for,
    #
    #
    # Returns a Button object.
    #
    # Typical usage
    #
    #    browser.button(:id,    'b_1')                             # access the button with an ID of b_1
    #    browser.button(:name,  'verify_data')                     # access the button with a name of verify_data
    #    browser.button(:xpath, "//input[@value='Click Me']/")     # access the button with a value of Click Me
    #
    # If only a single parameter is supplied, then :value is used
    #    browser.button('Click Me')                                # access the button with a value of Click Me
    def button(how,what)
      return Button.new(self, how,what)
    end
    
    # This is the main method for accessing a check box. Usually an <input type = checkbox> HTML tag.
    #
    #  *  how   - symbol - how we access the check box - :index, :id, :name etc
    #  *  what  - string, integer or regular expression - what we are looking for,
    #
    # returns a CheckBox object
    #
    # Typical usage
    #
    #    browser.checkbox(:id, 'send_email')                    # access the check box with an id of send_mail
    #    browser.checkbox(:name, 'send_copy')                   # access the check box with a name of send_copy
    #    browser.checkbox(:index, 2)                            # access the second check box on the page (1 based, so the first field is accessed with :index,1)
    def check_box(how,what)
      return CheckBox.new(self, how, what)
    end
    
    # This is the main method for accessing a radio button. Usually an <input type = radio> HTML tag.
    #  *  how   - symbol - how we access the radio button, :index, :id, :name etc
    #  *  what  - string, integer  - what we are looking for,
    #
    # Valid values for 'how' are listed in the Watir Wiki - http://wiki.openqa.org/display/WTR/Methods+supported+by+Element
    #
    # returns a Radio object
    #
    # Typical usage
    #
    #    browser.radio(:id, 'send_email')                   # access the radio button with an id of currency
    #    browser.radio(:name, 'send_copy')                  # access the radio button with a name of country
    def radio(how,what)
      return Radio.new(self, how, what)
    end
    
    # This is the main method for accessing a link.
    #  *  how   - symbol - how we access the link, :index, :id, :name, :title, :text, :url
    #  *  what  - string, integer  - what we are looking for,
    #
    # Valid values for 'how' are listed in the Watir Wiki - http://wiki.openqa.org/display/WTR/Methods+supported+by+Element
    #
    # returns a Link object
    #
    # Typical Usage
    #
    #   browser.link(:url, /login/)              # access the first link whose url matches login. We can use a string in place of the regular expression
    #                                       # but the complete path must be used, browser.link(:url, 'http://myserver.com/my_path/login.asp')
    #   browser.link(:index,2)                   # access the second link on the page
    #   browser.link(:title, "Picture")         # access a link using the tool tip
    #   browser.link(:text, 'Click Me')          # access the link that has Click Me as its text
    #   browser.link(:xpath, "//a[contains(.,'Click Me')]/")      # access the link with Click Me as its text
    def link(how,what)
      return Link.new(self, how,what)
    end
    
    # This is the main method for accessing images - normally an <img src="image.gif"> HTML tag.
    #  *  how   - symbol - how we access the image, :index, :id, :name, :src, :title or :alt are supported
    #  *  what  - string, integer- what we are looking for,
    #
    #
    # returns an Image object
    #
    # Typical Usage
    #
    #   browser.image(:index,2)                  # access the second image on the page
    #   browser.image(:alt, "A Picture")         # access an image using the alt text
    #   browser.image(:xpath, "//img[@alt='A Picture']/")    # access an image using the alt text
    def image(how,what)
      return Image.new(self, how, what)
    end
    
    # This is the main method for accessing a selection list. Usually a <select> HTML tag.
    #  *  how   - symbol - how we access the selection list, :index, :id, :name etc
    #  *  what  - string, integer - what we are looking for,
    #
    #
    # returns a SelectList object
    #
    # Typical usage
    #
    #    browser.select_list(:id, 'currency')                   # access the select box with an id of currency
    #    browser.select_list(:name, 'country')                  # access the select box with a name of country
    #    browser.select_list(:name, /n_/)                       # access the first select box whose name matches n_
    #    browser.select_list(:index, 2)                         # access the second select box on the page (1 based, so the first field is accessed with :index,1)
    #    browser.select(:xpath, "//select[@id='currency']/")    # access the select box with an id of currency
    def select_list(how,what)
      return SelectList.new(self,how,what)
    end
    
    # This is the main method for accessing a text area
    #  *  how   - symbol - how we access the field, :index, :id, :name etc
    #  *  what  - string, integer or regular expression - what we are looking for,
    #
    # returns a TextArea object
    #
    # Typical Usage
    #
    #    browser.text_area(:id,   'user_name')                 # access the text field with an ID of user_name
    #    browser.text_area(:name, 'address')                   # access the text field with a name of address
    #    browser.text_area(:index, 2)                          # access the second text field on the page (1 based, so the first field is accessed with :index,1)
    #    browser.text_area(:xpath, "//textarea[@id='user_name']/")    # access the text field with an ID of user_name
    def text_area(how,what)
      return TextArea.new(self,how,what)
    end
    
    # This is the main method for accessing a frame
    #  *  how   - symbol - how we access the frame, :index, :id, :name etc
    #  *  what  - string, integer or regular expression - what we are looking for,
    #
    # returns a Frame object
    #
    # Typical Usage
    #
    #    browser.frame(:id,   'side_bar')                 # access the frame with an ID of side bar
    def frame(how,what)
      return Frame.new(self,how,what)
    end
    
    # This is the main method for accessing a div control
    #  *  how   - symbol - how we access the field, :index, :id, :name etc
    #  *  what  - string, integer or regular expression - what we are looking for,
    #
    # returns a Div object
    #
    # Typical Usage
    #
    #    browser.div(:id,   'user_name')                 # access the div with an ID of user_name
    #    browser.div(:name, 'address')                   # access the div with a name of address
    def div(how,what)
      return Div.new(self,how,what)
    end
    
    # This is the main method for accessing a span control
    #  *  how   - symbol - how we access the field, :index, :id, :name etc
    #  *  what  - string, integer or regular expression - what we are looking for,
    #
    # returns a Span object
    #
    # Typical Usage
    #
    #    browser.span(:id,   'user_name')                 # access the span with an ID of user_name
    #    browser.span(:name, 'address')                   # access the span with a name of address
    def span(how,what)
      return Span.new(self,how,what)
    end
    
    # This is the main method for accessing a table control
    #  *  how   - symbol - how we access the field, :index, :id, :name etc
    #  *  what  - string, integer or regular expression - what we are looking for,
    #
    # returns a Table object
    #
    # Typical Usage
    #
    #    browser.table(:id,   'user_name')                 # access the table with an ID of user_name
    #    browser.table(:name, 'address')                   # access the table with a name of address
    def table(how,what)
      return Table.new(self,how,what)
    end
    
    #This is the main method for accessing a file field. Usually an <input type = file> HTML tag.
    #
    # *  how   - symbol - how we access the field, valid values are
    #   :index      - find the file field using index
    #   :id         - find the file field using id attribute
    #   :name       - find the file field using name attribute
    #   :xpath      - find the file field using xpath query
    # *  what  - string, integer, regular expression, or xpath query - what we are looking for,
    #
    #returns a FileField object
    #
    #Typical Usage
    #
    #   browser.file_field(:id,   'up_1')                     # access the file upload field with an ID of up_1
    #   browser.file_field(:name, 'upload')                   # access the file upload field with a name of upload
    def file_field(how,what)
      return FileField.new(self, how, what)
    end

    #This is the method for accessing the radio buttons iterator. Returns a Radios object
    #
    #Typical usage:
    #
    #  browser.radios.each { |r| puts r.to_s }            # iterate through all the radio buttons on the page
    #  browser.radios[1].to_s                             # goto the first radio button on the page
    #  browser.radios.length                              # show how many radio buttons are on the page.
    def radios
      return Radios.new(self)
    end
    
    #This is the main method for accessing the links collection. Returns a Links object

    #Typical usage:

    #  browser.links.each { |l| puts l.to_s }            # iterate through all the links on the page
    #  browser.links[1].to_s                             # goto the first link on the page
    #  browser.links.length                              # show how many links are on the page
    def links
      return Links.new(self)
    end

    #This is the main method for accessing the images collection. Returns an Images object
    #
    #Typical usage:
    #
    #  browser.images.each { |i| puts i.to_s }            # iterate through all the images on the page
    #  browser.images[1].to_s                             # goto the first image on the page
    #  browser.images.length                              # show how many images are on the page.
    def images
      return Images.new(self)
    end

    #this is the method for accessing the text_fields iterator. It returns a Text_Fields object
    #
    #Typical usage:
    #
    #  browser.text_fields.each { |t| puts t.to_s }            # iterate through all the text fields on the page
    #  browser.text_fields[1].to_s                             # goto the first text field on the page
    #  browser.text_fields.length                              # show how many text field are on the page.
    def text_fields
      return TextFeilds.new(self)
    end

    #this is the method for accessing the check boxes iterator. Returns a CheckBoxes object
    #
    #Typical usage:
    #
    #  browser.checkboxes.each { |c| puts c.to_s }             # iterate through all the check boxes on the page
    #  browser.checkboxes[1].to_s                              # goto the first check box on the page
    #  browser.checkboxes.length                               # show how many check boxes are on the page.
    def checkboxes
      return CheckBoxes.new(self)
    end

    #this is the main method for accessing the buttons iterator. It returns a Buttons object
    #
    #Typical usage:
    #
    #  browser.buttons.each { |b| puts b.to_s }                   # iterate through all the buttons on the page
    #  browser.buttons[1].to_s                                    # goto the first button on the page
    #  browser.buttons.length                                     # show how many buttons are on the page.
    def buttons
      return Buttons.new(self)
    end

    #this is the method for accessing the select lists iterator. Returns a SelectLists object
    #
    #Typical usage:
    #
    #  browser.select_lists.each { |s| puts s.to_s }            # iterate through all the select boxes on the page
    #  browser.select_lists[1].to_s                             # goto the first select boxes on the page
    #  browser.select_lists.length                              # show how many select boxes are on the page.
    def select_lists
      return SelectLists.new(self)
    end
    #chrome will wait the page to load.
    def wait_for_page_to_load
      default_time_out = 2
      sleep_time = 0.2
      counter = default_time_out/sleep_time
      js_eval("document.readyState")
      value = read_socket
      until(value.eql? "complete")
        sleep(sleep_time)
        js_eval("document.readyState")
        value = read_socket
        
        #For timeout
        counter -= 1
        if counter < 0
          close
          raise TimeOutException.new("Navigation timed out.") 
        end
      end
    end     
    
    def js_eval(string)
      sleep(0.1)
      @@command_to_run = "print #{string}\r\n"
      Connection.get.write(@@command_to_run)
      Connection.get.flush
    end
    def read_socket
      sleep(0.1)
      last_run_command = @@command_to_run.strip
      connection = Connection.get
      size = 4096
      receive = true
      value = ""
      while(receive)
          data = connection.recv(size)
          if data.length < size
            receive=false
          end 
          value += data
      end
         value_arr=value.split("\n")
        if value_arr.length > 1
            value_arr=value_arr.find_all{ |x| x.strip != "" }
            counter = -1
            while(true)
              counter -= 1
              line = value_arr[counter]
              break unless line
              if line.include?(last_run_command)
                break
              end
            end
            value = ""
            for i in ((counter+1).. -2)
              value += value_arr[i].strip! + "\n"
            end
            value.strip! unless value.include?("v8(running)>")
            value.sub!("null","") if value.eql? "null"
            return value
        else
          return value
        end
       return ""
    end
  end
end
