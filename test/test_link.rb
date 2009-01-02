require "setup"

class LinkTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("links1")
  end
  def teardown
    @browser.close
  end
  def test_link_text
   assert_equal("test1",@browser.link(:text,"test1").text)
  end

  def test_link_click
    @browser.link(:text,"test1").click()
    @browser.back
    @browser.link(:text, "Image and a text link").click
  end
  
end
