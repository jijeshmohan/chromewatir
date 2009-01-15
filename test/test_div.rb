require "setup"

class DivTest < Test::Unit::TestCase
  def teardown
    @browser.close
  end
  def test_div_exist
    @browser = start_browser("div") 
    assert_equal(true,@browser.div(:id, "div1").exist?)
    assert_equal(false,@browser.div(:id, "nodiv").exist?)
  end

end