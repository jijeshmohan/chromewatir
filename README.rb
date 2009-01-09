=begin rdoc
ChromeWatir is an implementation of Watir API for Google Chrome browser. The scripting is simple and is similar to Watir. The following is a sample code in ChromeWatir

  require "chrome_watir"
  browser = ChromeWatir::Browser.new
  browser.link(:text, "Advanced Search").click
  browser.text_field(:id, "as_oq0").set "watir"
  browser.text_field(:id, "as_oq1").set "ruby"
  browser.text_field(:id, "as_oq2").set "testing"
  browser.radio(:id, "ss").set
  browser.button(:value, "Advanced Search").click
=end