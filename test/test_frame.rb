require "setup"

class FrameTest < Test::Unit::TestCase
  def teardown
    @browser.close
  end
  def test_frame_exist
    @browser = start_browser("frame_buttons") 
    assert_equal(false,@browser.frame(:name, "noFrame").exist?)
    assert_equal(true,@browser.frame(:name, "buttonFrame").exist?)
  end
  def test_inside_frame
    @browser = start_browser("frame_buttons") 
    assert_equal('OldValue',@browser.frame(:name, "buttonFrame").text_field(:id,'text_id').value)
    text_obj= @browser.frame(:name, "buttonFrame").text_field(:id,'text_id')
    text_obj.set 'sample'
    assert_equal(true, @browser.frame(:name, "buttonFrame").button(:id, "b2").enabled?)
    assert_equal('sample',text_obj.value)
  end
  def test_nested_frame
    @browser = start_browser("nestedFrames") 
    message = "Hello Watir"
    @browser.frame(:name, "nestedFrame").frame(:name, "senderFrame").text_field(:id, "textToSend").set message
    @browser.frame(:name, "nestedFrame").frame(:name, "senderFrame").button(:name, "sendIt").click
    assert_equal(message, @browser.frame(:name, "nestedFrame").frame(:name, "receiverFrame").text_field(:name, "receiverText").value)
  end
end