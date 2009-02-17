require "setup"

class FileFieldTest < Test::Unit::TestCase
  include ChromeWatir::Exceptions
  def setup
    @browser = start_browser("fileupload")
  end
  def teardown
    #~ @browser.close
  end
  def test_fileField_Exists
    #test for existance of 4 file area
    assert(@browser.file_field(:name,"file1").exist?)
    assert(@browser.file_field(:id,"file2").exist?)
    #test for missing 
    assert_equal(false,@browser.file_field(:name, "missing").exist?)   
    assert_equal(false,@browser.file_field(:name,"totallybogus").exist?)
    #pop one open and put something in it.
    html_root = Dir.pwd + "/html/"
    @browser.file_field(:name,"file3").set(html_root + "fileupload.html")	
    sleep(2)
    #click the upload button
    @browser.button(:name,"upload").click
    
    assert(@browser.page_source.include?("PASS"))	
    #Working on failure part
    @browser.back
    @browser.file_field(:name,"file3").set(html_root + "notThere.html")	
  end

  #~ def test_fileField_iterator
      #~ assert_equal(6, @browser.file_fields.length)
      #~ arrFileFields = @browser.file_fields
      #~ assert_equal("file1", arrFileFields[1].name)
      #~ assert_equal("file2", arrFileFields[2].id)
      #~ assert_equal("disabled", arrFileFields[3].name)
      #~ assert_equal("file3", arrFileFields[4].name)
      #~ assert_equal("beforetest", arrFileFields[5].name)
      #~ assert_equal("aftertest", arrFileFields[6].name)
      #~ arrFileFields.each do |fileField|
        #~ assert_equal("file", fileField.type)
      #~ end
  #~ end
end