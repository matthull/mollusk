$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'mollusk'

Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each { |f| require f }
