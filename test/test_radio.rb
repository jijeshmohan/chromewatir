require "setup"

class RadioTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("radioButtons1")
  end
  def teardown
    @browser.close
  end
  def test_set_radio
    @browser.radio(:name,"box1").set
  end
  def test_clear_radio
    @browser.radio(:name,"box1").clear
  end
end
