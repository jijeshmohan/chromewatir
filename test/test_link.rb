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
  
  def test_link_has_image
      assert_equal(false,@browser.link(:text,"test1").has_image?)
     assert_equal(true,@browser.link(:index,3).has_image?)
     assert_equal(false,@browser.link(:index,1).has_image?)
     assert_equal(true,@browser.link(:id,"img3").src.include?('html/images/button.jpg'))
  end
  def test_link_click
    @browser.link(:text,"test1").click()
    assert_match(/Test page for Links/, @browser.title)
    @browser.back
    @browser.link(:xpath, "//a[3]/img").click
    assert_match(/pass3/, @browser.url)

  end
  
end
