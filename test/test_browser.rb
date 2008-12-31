require "setup"

class BrowserTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("links1")
  end
  def teardown
    @browser.close
  end
  def test_browser_title
    assert_equal("Test page for Links",@browser.title)
  end
  def test_browser_url
    assert_match(/links1/,@browser.url)
  end
  def test_browser_navigation
    @browser.link(:link_text, "test1").click
    assert_match(/links2/,@browser.url)
    @browser.back
    assert_match(/links1/,@browser.url)
    @browser.forward
    assert_match(/links2/,@browser.url)
  end
  def test_page_source
    @browser.link(:link_text, "test1").click
    assert_match(/Links2-Pass/,@browser.page_source)
  end
end