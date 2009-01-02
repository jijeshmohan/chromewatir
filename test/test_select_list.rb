require "setup"

class SelectListTest < Test::Unit::TestCase
  include ChromeWatir::Exceptions
  def setup
    @browser = start_browser("selectboxes1")
  end
  def teardown
    @browser.close
  end
   def test_select_list_exist
    assert_equal(true, @browser.select_list(:name, "sel1").exist?)
    assert_equal(false,@browser.select_list(:name, "missing").exist?) 
  end
  
  def test_select_list_enabled
        assert_equal(true,@browser.select_list(:name, "sel1").enabled?)   
  end
    
  def test_select_list_getAllContents
         assert_equal( ["Option 1" ,"Option 2" , "Option 3" , "Option 4"] , 
        @browser.select_list(:name, "sel1").getAllContents)   
  end
  
  def test_select_list_getSelectedItems
     assert_equal( ["Option 3" ] , @browser.select_list(:name, "sel1").getSelectedItems) 
    assert_equal(true, @browser.select_list(:name, 'sel2').selected?('Option 3'))
  end
  def test_select_list_select
    @browser.select_list(:name, "sel1").select("Option 1") 
    assert_equal( ["Option 1" ] , @browser.select_list(:name, "sel1").getSelectedItems)
  end
end

 