require "setup"

class RadioTest < Test::Unit::TestCase
  def setup
    @browser = start_browser("radioButtons1")
  end
  def teardown
    @browser.close
  end
  #~ def test_set_radio
    #~ @browser.radio(:name,"box1").set
    #~ assert_equal(true,@browser.radio(:name,"box1").checked?)
  #~ end
  #~ def test_clear_radio
    #~ @browser.radio(:name,"box1").clear
    #~ assert_equal(false,@browser.radio(:name,"box1").checked?)
  #~ end
  def test_radio_iterators
    assert_equal(11, @browser.radios.length)
    assert_equal("box5" , @browser.radios[2].id )
    assert_equal(true ,  @browser.radios[3].disabled )
    assert_equal(false ,  @browser.radios[1].disabled )
    
    index = 1
    @browser.radios.each do |r|
      assert_equal( @browser.radio(:index, index).name , r.name )
      assert_equal( @browser.radio(:index, index).id , r.id )
      assert_equal( @browser.radio(:index, index).value, r.value)
      assert_equal( @browser.radio(:index, index).disabled , r.disabled )
      index+=1
    end
    assert_equal(index -1, @browser.radios.length)
  end  
end
