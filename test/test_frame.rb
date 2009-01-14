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
  def test_inside_frame
    assert_equal('OldValue',@browser.frame(:name, "buttonFrame").text_field(:id,'text_id').value)
    text_obj= @browser.frame(:name, "buttonFrame").text_field(:id,'text_id')
    text_obj.set 'sample'
    assert_equal(true, @browser.frame(:name, "buttonFrame").button(:id, "b2").enabled?)
    assert_equal('sample',text_obj.value)
    
  end
end