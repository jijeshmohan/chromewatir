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
    
  def test_select_list_get_all_contents
         assert_equal( ["Option 1" ,"Option 2" , "Option 3" , "Option 4"] , 
        @browser.select_list(:name, "sel1").get_all_contents)   
  end
  
  def test_select_list_get_selected_items
     assert_equal( ["Option 3" ] , @browser.select_list(:name, "sel1").get_selected_items) 
    assert_equal(true, @browser.select_list(:name, 'sel2').selected?('Option 3'))
  end
  def test_select_list_select
    @browser.select_list(:name, "sel1").select("Option 1") 
    assert_equal( ["Option 1" ] , @browser.select_list(:name, "sel1").get_selected_items)
    @browser.select_list(:name, "sel2").select("Option 1") 
     assert_equal( ["Option 1" ,"Option 3","Option 6"  ] , @browser.select_list(:name, "sel2").get_selected_items) 
      assert_raises(NoValueFoundException){ @browser.select_list(:name, "sel1").select("missing") }
  end
  def test_select_list_includes
  
    assert_equal(true, @browser.select_list(:name, "sel1").includes?("Option 1"))
  end
  def test_select_list_select_value
     @browser.select_list(:name, "sel1").select_value("o2") 
    assert_equal( ["Option 2" ] , @browser.select_list(:name, "sel1").get_selected_items)
    assert_raises(NoValueFoundException){ @browser.select_list(:name, "sel1").select_value("missing") }
  end
  def test_select_list_type
    assert_equal("select-multiple", @browser.select_list(:name, "sel2").type)
    assert_equal("select-one", @browser.select_list(:name, "sel1").type)    
  end
end

 