require "rubygems"
require "socket"
require "win32/process"
require "rbconfig"
lib_directory = File.dirname(__FILE__) + "/chrome_watir/"
elements_directory = lib_directory + "/elements/"

require lib_directory + "chrome_connection"
require lib_directory + "exceptions"
require lib_directory + "container"
require lib_directory + "launcher"
require lib_directory + "browser"

require elements_directory + "web_element"
require elements_directory + "input_element"
require elements_directory + "button"
require elements_directory + "text_field"
require elements_directory + "image"
require elements_directory + "radio"
require elements_directory + "check_box"
require elements_directory + "link"
require elements_directory + "select_list"

module ChromeWatir
end