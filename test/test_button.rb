require "setup"

class ButtonTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("buttons1")
  end
  def teardown
    @browser.close
  end
  def test_click_button
    @browser.button(:id, "b2").click()
    assert_equal("Pass Page", @browser.title)
  end
end
