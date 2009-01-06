require "setup"

class CheckBoxTest < Test::Unit::TestCase
  include ChromeWatir::Exceptions
  def setup
    @browser = start_browser("checkboxes1")
  end
  def teardown
    @browser.close
  end
  def test_check_box_set
    @browser.check_box(:name, "box1").set
    assert_equal(true, @browser.check_box(:name, "box1").checked?)
  end
  def test_check_box_clear
    @browser.check_box(:name, "box1").clear
    assert_equal(false,@browser.check_box(:name, "box1").checked?)
  end
  def test_check_box_index
    assert_equal("verify1",@browser.check_box(:index,3).name)
  end
  def test_check_box_properties
    assert_raises(UnknownObjectException , "UnknownObjectException was supposed to be thrown" ) {   @browser.check_box(:name, "noName").id   }  
    assert_raises(UnknownObjectException , "UnknownObjectException was supposed to be thrown" ) {   @browser.check_box(:name, "noName").name   }  
    assert_raises(UnknownObjectException , "UnknownObjectException was supposed to be thrown" ) {   @browser.check_box(:name, "noName").disabled   }  
    assert_raises(UnknownObjectException , "UnknownObjectException was supposed to be thrown" ) {   @browser.check_box(:name, "noName").type   }  
    assert_raises(UnknownObjectException , "UnknownObjectException was supposed to be thrown" ) {   @browser.check_box(:name, "noName").value   }  
    
    assert_equal("box1"  , @browser.check_box(:index, 1).name  ) 
    assert_equal(""  , @browser.check_box(:index, 1).id  ) 
    assert_equal("checkbox"  , @browser.check_box(:index, 1).type  ) 
    assert_equal(""  , @browser.check_box(:index, 1).value  ) 
    assert_equal(false  , @browser.check_box(:index, 1).disabled  ) 
  end
end
