
#Run all the tests in the folder
Dir.glob("test_*.rb").each do|file|
  puts "************Running #{file}**************"
  require file 
end
