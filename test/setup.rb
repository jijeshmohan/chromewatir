
CHROME_LIB_PATH = File.dirname(__FILE__) + "/../" + "lib"
$LOAD_PATH.unshift CHROME_LIB_PATH

require "test/unit"
require "chrome_watir"
require "chrome_watir/exceptions"

def start_browser(page)
  html_folder_path = "file:///" + Dir.pwd + "/html/"
  url = "#{html_folder_path}#{page}.html"
  browser = ChromeWatir::Browser.new
  browser.goto url
  return browser
end
