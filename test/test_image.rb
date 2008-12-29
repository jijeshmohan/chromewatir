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
    @browser.back
    @browser.image(:name,"tsogpsb").click
    @browser.back
    @browser.image(:xpath, "//img[@name='disabler_test']").click
  end
end
