require "setup"

class ImageTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("images1")
  end
  def teardown
    @browser.close
  end
  def test_click_image
    @browser.image(:name, "disabler_test").click()
    assert_equal("Pass Page", @browser.title)
    @browser.back
    @browser.image(:name,"tsogpsb").click
    @browser.back
    @browser.image(:xpath, "//img[@name='disabler_test']").click
  end
  def test_alt_src_image
      assert_equal('images/circle.jpg',@browser.image(:alt, "circle").src)
       assert_equal('circle',@browser.image(:src, "images/circle.jpg").alt)
  end
end
