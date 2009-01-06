require "setup"

class TextAreaTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("textarea")
  end
  def teardown
    @browser.close
  end
  def test_textarea_exist_or_not
    assert_equal(true,@browser.text_area(:name,"txtMultiLine1").exist?)
    assert_equal(true,@browser.text_area(:name,"txtMultiLine2").exist?)
    assert_equal(true,@browser.text_area(:name,"txtMultiLine3").exist?)
    assert_equal(true,@browser.text_area(:name,"txtReadOnly").exist?)
    
    assert_equal(true,@browser.text_area(:id,"txtMultiLine1").exist?)
    assert_equal(true,@browser.text_area(:id,"txtMultiLine2").exist?)
    assert_equal(true,@browser.text_area(:id,"txtMultiLine3").exist?)
    assert_equal(true,@browser.text_area(:id,"txtReadOnly").exist?)

    assert_equal(false,@browser.text_area(:name, "missing").exist?)   
    assert_equal(false,@browser.text_area(:name,"txtMultiLine4").exist?)
  end  
  def test_textarea_set_clear
    @browser.text_area(:name, "txtMultiLine1").append(" Some Text")
    assert_equal("Hello World Some Text", @browser.text_area(:name, "txtMultiLine1").value )     
    
    @browser.text_area(:name, "txtMultiLine1").set("watir IE Controller")
    assert_equal("watir IE Controller", @browser.text_area(:name, "txtMultiLine1").value )  
    
    @browser.text_area(:name, "txtMultiLine2").clear
    assert_equal("" , @browser.text_area(:name, "txtMultiLine2").value )     
  end
end