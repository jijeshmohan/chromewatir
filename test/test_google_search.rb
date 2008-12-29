require "setup"

class GoogleSearchTest < Test::Unit::TestCase
  def setup
    url = "http://www.google.com"
    @browser = ChromeWatir::Browser.new
    @browser.goto url
  end
  def teardown
    @browser.close
  end
  def test_do_advanced_search
    @browser.link(:link_text, "Advanced Search").click
    @browser.text_field(:id, "as_oq0").set "watir"
    @browser.text_field(:id, "as_oq1").set "ruby"
    @browser.text_field(:id, "as_oq2").set "testing"
#    @browser.radio(:id, "ss").set
    @browser.button(:value, "Advanced Search").click
  end
end
