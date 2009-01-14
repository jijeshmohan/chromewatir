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
    assert_equal(true,@browser.frame(:name, "buttonFrame2").exist?)
  end
  #~ def test_nested_element
    #~ assert_equal("OldValue", @browser.frame(:name, "buttonFrame").text_field(:id, "text_id").value)
    #~ assert_match(/Blank page to fill in the frames/, @browser.frame(:name, "buttonFrame2").page_source)
    #~ assert_equal(true,@browser.frame(:name, "buttonFrame").button(:id, "b2").exist?)
  #~ end
end