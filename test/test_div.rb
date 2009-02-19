require "setup"

class DivTest < Test::Unit::TestCase
  def teardown
    @browser.close
  end
  def setup
    @browser = start_browser("div") 
  end
  def test_div_exist 
    assert_equal(true,@browser.div(:id, "div1").exist?)
    assert_equal(false,@browser.div(:id, "nodiv").exist?)
  end
  def test_div_click
     assert_equal(true,@browser.text_field(:name, "text1").verify_contains("0")  )
      @browser.div(:id, "div3").click
    assert_equal(true, @browser.text_field(:name, "text1").verify_contains("1")  )
  end
  def test_inside_div
    second_text=@browser.div(:id, "text_fields1").text_field(:index,2)
    @browser.text_field(:name, "div_text2").set 'watir'
    @browser.div(:id, "text_fields1").text_field(:name,'div_text1').set 'sample'
    assert_equal('sample', @browser.text_field(:name, "div_text1").value)
    assert_equal('watir', second_text.value)
  end
 
end