require "setup"

class CheckBoxTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("checkboxes1")
  end
  def teardown
    @browser.close
  end
  def test_check_box_set
    @browser.check_box(:name, "box1").set
    puts @browser.check_box(:name, "box1").checked?
  end
  def test_check_box_clear
    @browser.check_box(:name, "box1").clear
  end
end
