require "setup"

class ImageTest < Test::Unit::TestCase
  include ChromeWatir::Exceptions
  def setup
    @browser = start_browser("images1")
  end
  def teardown
    @browser.close
  end
  def test_click_image
    @browser.image(:name, "disabler_test").click()
    assert_equal("Pass Page", @browser.title)
    @browser.back
    @browser.image(:name,"tsogpsb").click
    @browser.back
    @browser.image(:xpath, "//img[@name='disabler_test']").click
  end
  def test_image_properties
    assert_raises(UnknownObjectException ) { @browser.image(:index, 82).name }
    assert_raises(UnknownObjectException ) { @browser.image(:index, 82).id }
    assert_raises(UnknownObjectException ) { @browser.image(:index, 82).src }
    assert_raises(UnknownObjectException ) { @browser.image(:index, 82).value }
    
    assert_raises(UnknownObjectException ) { @browser.image(:index, 82).alt}
    assert_raises(UnknownObjectException ) { @browser.image(:index, 82).title}
    
    assert_equal( ""       , @browser.image(:index, 2).name ) 
    assert_equal( "square" , @browser.image(:index, 2).id )
    assert_match( /square\.jpg/i ,@browser.image(:index, 2).src )
    assert_equal( "" , @browser.image(:index, 2).value )
    
    #~ # tool tips: alt text + title
    assert_equal('circle' , @browser.image(:index, 6).alt) 
    assert_equal( ""      , @browser.image(:index, 2).alt) 
    assert_equal('square_image', @browser.image(:id, 'square').title)    
    
      assert_equal('images/circle.jpg',@browser.image(:alt, "circle").src)
      assert_equal('circle',@browser.image(:src, "images/circle.jpg").alt)    
  end
end
