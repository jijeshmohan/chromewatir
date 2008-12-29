
CHROME_LIB_PATH = File.dirname(__FILE__) + "/../" + "lib"
$LOAD_PATH.unshift CHROME_LIB_PATH

require "test/unit"
require "chrome_watir"

def start_browser(page)
  path = "file:///E:/MyCodeRepo/chrome_watir/test/html/"
  url = "#{path}#{page}.html"
  browser = ChromeWatir::Browser.new
  browser.goto url
  return browser
end
