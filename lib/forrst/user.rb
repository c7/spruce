require 'uri'
require 'yajl'
require 'rest_client'

require 'forrst/user/posts'

module Forrst
  class User
    INFO_RESOURCE = "#{API_URI}#{API_VERSION}/users/info"
    
    attr_reader :username, :id, :raw_data
    
    def self.find(id)
      (id.is_a? Fixnum) ? self.find_by_user_id(id) : self.find_by_username(id)
    end
    
    def initialize(uri)
      begin
        response = RestClient.get uri
        
        if response.code == 200
          @raw_data = Yajl::Parser.parse(response.body)['resp']['user']
          @username = @raw_data['username']
          @id = @raw_data['id'].to_i # Should be a Fixnum from the start
        end
        
      rescue RestClient::ResourceNotFound
        raise Exceptions::UserNotFound
      end
    end
    
    def posts
      @posts ||= Posts.new(username)
      @posts.latest
    end
    
    def posts_before(post_id)
      @posts ||= User::Posts.new(username)
      @posts.before(post_id)
    end
    
  private
    def self.find_by_user_id(user_id)
      raise Exceptions::InvalidId unless user_id.is_a? Fixnum
      self.new("#{INFO_RESOURCE}?id=#{user_id}")
    end
    
    def self.find_by_username(username)
      raise Exceptions::InvalidUsername unless username.is_a? String
      self.new("#{INFO_RESOURCE}?username=#{username}")
    end
  end
end