require "setup"

class TextFieldTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("textfields1")
  end
  def teardown
    @browser.close
  end
  def test_set_text_field
    @browser.text_field(:name, "text1").set "ni hao"
    assert_equal("ni hao",@browser.text_field(:name,"text1").value)
  end
  def test_clear_text_field
    @browser.text_field(:name,"text1").clear
    assert_equal("",@browser.text_field(:name,"text1").value)
  end
  def test_append_text_field
    @browser.text_field(:name, "text1").set "ni hao"
    @browser.text_field(:name, "text1").append " wei"
    assert_equal("ni hao wei",@browser.text_field(:name,"text1").value) 
    assert_equal(true,@browser.text_field(:name,"text1").verify_contains("hao"))        
    assert_equal(false, @browser.text_field(:name,"text1").verify_contains("hello"))
  end
end