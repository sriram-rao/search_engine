require_relative '../start.rb'


#Please do gem install rack && gem install rack-test before running the test

require 'rack/test'
require 'capybara/rspec'

set :environment , :test

Capybara.app = Sinatra::Application

Rspec.configure do|config|
  config.include Capybara::DSL
end

describe "class Server" do
  include Rack::Test::Methods
 

  it "should check if database exists" do
    server = Server.new('test.db')
    server.check_table("words").should be_true
  end

  it "should start crawling" do
    server = Server.new('test.db')
    server.start_crawling('https://www.coursera.org/')
    server.crawling_status.should be_true
  end


 

  it "should start sinatra serve" do
    server = Server.new('test.db')
    get '/'
    last_response.should be_ok
  end

  it "should check for the form" do
    visit '/'
    page.has_selector?('input[name=\'q\']').should be_true
  end

end
