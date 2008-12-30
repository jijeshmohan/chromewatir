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
    puts "title - " + @browser.url
    assert_equal("",@browser.text_field(:name,"text1").value)
  end
end