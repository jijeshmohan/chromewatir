require "setup"

class FrameTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("frame_buttons") 
  end
  def teardown
    @browser.close
  end
  def test_frame_exist
    assert_equal(false,@browser.frame(:name, "noFrame").exist?)
    assert_equal(true,@browser.frame(:name, "buttonFrame").exist?)
  end
end