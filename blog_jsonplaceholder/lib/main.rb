require 'httparty'
require 'json'
require 'pry'
require 'pry-nav'



class BlogApiClient
  include HTTParty
  base_uri  ('jsonplaceholder.typicode.com')

  def initialize
    @options = { headers: { 'Content-type': 'application/json; charset=UTF-8' } }
  end

  # Create
  def create(title, body, user_id)
    payload = { title: title, body: body, userId: user_id }.to_json
    response = self.class.post('/post', {body: payload }.merge(@options))
    puts "response body #{response.body}"
    puts "response code #{response.code}"
  end
end



blog = BlogApiClient.new
blog.create('Olá mundo', 'skillersdevs programadores', 1)