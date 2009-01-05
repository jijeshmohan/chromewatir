require "setup"

class ButtonTest < Test::Unit::TestCase
  include ChromeWatir::Exceptions
  def setup
    @browser = start_browser("buttons1")
  end
  def teardown
    @browser.close
  end
  #~ def test_click_button
    #~ assert_raise(UnknownObjectException){@browser.button(:id, "notThere").click}
    #~ assert_raise(ObjectDisabledException){@browser.button(:id, "b9").click}
    #~ @browser.button(:id, "b2").click()
    #~ assert_equal("Pass Page", @browser.title)
  #~ end
  #~ def test_button_exist
    #~ assert_equal(false, @browser.button(:id, "notThere").exist?)
    #~ assert_equal(true, @browser.button(:id, "b2").exist?)
  #~ end
  #~ def test_button_enabled
    #~ assert_equal(true, @browser.button(:id, "b2").enabled?)
    #~ assert_equal(false, @browser.button(:name, "b8").enabled?)
  #~ end
  def test_button_properties
     assert_equal("b1"  , @browser.button(:id, "b2").name )
     assert_equal("b2"  , @browser.button(:name, "b1").id )
     assert_equal("button"  , @browser.button(:id, "b2").type  )
     assert_equal("Click Me"  , @browser.button(:id, "b2").value  )
     assert_equal(false  , @browser.button(:id, "b2").disabled  )
     assert_equal("italic_button"  , @browser.button(:name, "b1").class_name  )
     assert_equal(""  , @browser.button(:name , "b4").class_name  )

     assert_equal("b1"  , @browser.button(:id, "b2").name  )
     assert_equal("b2"  , @browser.button(:id, "b2").id  )
     assert_equal("button"  , @browser.button(:id, "b2").type  )

     assert_equal("b4"  , @browser.button(:id, "b5").name  )
     assert_equal("b5"  , @browser.button(:name, "b4").id  )
     assert_equal("button"  , @browser.button(:id, "b5").type  )
     assert_equal("Disabled Button"  , @browser.button(:id, "b5").value  )
     assert_equal(true  , @browser.button(:id, "b5").disabled  )

     assert_equal( "" , @browser.button(:id, "b5").title )
     assert_equal( "this is button1" , @browser.button(:id, "b2").title )    
  end
end
