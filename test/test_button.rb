require "setup"

class ButtonTest < Test::Unit::TestCase
  include ChromeWatir::Exceptions
  def setup
    @browser = start_browser("buttons1")
  end
  def teardown
    @browser.close
  end
  def test_click_button
    assert_raise(UnknownObjectException){@browser.button(:id, "notThere").click}
    @browser.button(:id, "b2").click()
    assert_equal("Pass Page", @browser.title)
  end
  def test_button_exist
    assert_equal(false, @browser.button(:id, "notThere").exist?)
    assert_equal(true, @browser.button(:id, "b2").exist?)
  end
end
