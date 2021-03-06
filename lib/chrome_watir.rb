require "rubygems"
require "socket"
require "win32/process"
require "win32/registry"
require "rbconfig"
lib_directory = File.dirname(__FILE__) + "/chrome_watir/"
elements_directory = lib_directory + "/elements/"

require lib_directory + "chrome_connection"
require lib_directory + "exceptions"
require lib_directory + "container"
require lib_directory + "launcher"
require lib_directory + "browser"
require lib_directory + "locator_factory"
require lib_directory + "auto_it"

require elements_directory + "web_element"
require elements_directory + "input_element"
require elements_directory + "element_collections"
require elements_directory + "text_element"
require elements_directory + "input_option_element"
require elements_directory + "frame"
require elements_directory + "div"
require elements_directory + "span"
require elements_directory + "table"
require elements_directory + "button"
require elements_directory + "file_field"
require elements_directory + "text_area"
require elements_directory + "text_field"
require elements_directory + "image"
require elements_directory + "radio"
require elements_directory + "check_box"
require elements_directory + "link"
require elements_directory + "select_list"

=begin rdoc
*ChromeWatir* is an implementation of Watir API for Google Chrome browser. 
The scripting is simple and is similar to Watir
=end
module ChromeWatir
end