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
 def test_table_row_count
  assert_equal(2,@browser.table(:id,"tblTest").row_count)
  assert_equal(2,@browser.table(:id,"tblTest").length)
  assert_equal(2,@browser.table(:id,"tblTest")[1].column_count)
 end
 def test_table_column
  assert_equal(2,@browser.table(:id,"tblTest").column_count)
  assert_equal('Row 1 Col1',@browser.table(:id,"tblTest")[1][1].text)
 end
end
