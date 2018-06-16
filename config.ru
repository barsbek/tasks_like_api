$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rubygems'
require 'bundler/setup'

Bundler.require :default, :development

require 'api'

app = Rack::Builder.new do
  use Rack::Cors do
    allow do
      origins "*"
      resource "*", headers: :any, methods: [:get, :post, :put, :delete]
    end
  end
  run TasksLike::API
end

run app
