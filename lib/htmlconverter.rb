$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'Qt'
require 'qtwebkit'
require 'tmpdir'

require 'htmlconverter/base'
require 'htmlconverter/renderer/base'
require 'htmlconverter/renderer/pdf'
require 'htmlconverter/renderer/ps'

module HtmlConverter
  VERSION = '0.0.1'
end
