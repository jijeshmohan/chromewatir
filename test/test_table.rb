require "setup"

class TableTest < Test::Unit::TestCase
  def teardown
    @browser.close
  end
  def setup
    @browser = start_browser("table1") 
  end
  def test_table_exist 
    assert_equal(true,@browser.table(:id, "tblTest").exist?)
    assert_equal(false,@browser.table(:id, "nodiv").exist?)
  end
 def test_table_rowcount
  assert_equal(2,@browser.table(:id,"tblTest").row_count)
 end
 
end