$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

puts '------'
puts File.join(File.dirname(__FILE__), 'lib')
puts '------'

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, :development

require 'api'

app = Rack::Builder.new do
  use Rack::Cors do
    allow do
      origins "*"
      resource "*", headers: :any, methods: [:post, :put]
    end
  end
  run TasksLike::API
end

run app
