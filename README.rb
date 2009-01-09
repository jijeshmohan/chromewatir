=begin rdoc
Introducing ChromeWatir - An implementation of Watir API for Google Chrome browser. http://code.google.com/p/chrome-watir/

To Install ruby:    http://www.ruby-lang.org
   The instructions to install ruby must be available in the website. Once you install check the installation
   by typing > ruby -v in the commandline which should give the version number of ruby.

To Install ChromeWatir:
   Best way to install is to use the gem. You can download the gem from Google code project
   http://code.google.com/p/chrome-watir/

   From your command line:
     > gem install chrome_watir

Where To Use:
   chrome_watir works on Windows. It has been tested on XP with Google Chrome.
   If you have watir or firewatir scripts you must be able to use those on ChromeWatir by making a
   few changes.
   
User Guide:    http://code.google.com/p/chrome-watir/wiki/UserGuide

Testing chrome-watir:
   Run the unit tests in a cmd shell. Go to the dir where you installed it and then type 'ruby test/<testname.rb>'.
   The unit test uses a sample html pages to run the tests which are packaged with the gem. 

Typical Usage
   # include the controller
   require "chrome_watir"
   # create an instance of the controller
   browser = ChromeWatir::Browser.new
   #Goto Google application advanced search page
   browser.goto 'http://www.google.com'
   browser.link(:text, "Advanced Search").click
   #search for watir, ruby or testing
   browser.text_field(:id, "as_oq0").set "watir"
   browser.text_field(:id, "as_oq1").set "ruby"
   browser.text_field(:id, "as_oq2").set "testing"
   browser.radio(:id, "ss").set
   browser.button(:value, "Advanced Search").click   

  Please refer the wiki or the typical usage in readme.
  
  ChromeWatir is a growing project. This is an initial release and there are lots of things planned for future release.
  If you find a defect or want to help out, please let us know.

Contacts:
   Sai Venkatakrishnan (saidesertrose2004@gmail.com)
   jijesh Mohan (jijesh.mohan@gmail.com)
=end