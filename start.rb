require 'mechanize'
require 'thread'
require_relative './crawler/crawler.rb'
require_relative './crawler/models.rb'
require_relative './dbconnect.rb'
require 'sinatra'

require 'sinatra'
get '/' do
 erb :form
end

def app
  Sinatra::Application
end

class Server
  attr_accessor :crawl

  def initialize table

  end

  def check_table table
    return ActiveRecord::Base.connection.table_exists?(:words)
  end

  def start_crawling link
    @thr = Thread.new {
      agent = Mechanize.new
      page = agent.get(link)
      crawl_bot= Crawler.new
      crawl_bot.crawl_page(link)
    }
  end

  def crawling_status
    return true if @thr.status
  end
 
 


end
