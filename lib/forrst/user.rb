# encoding: utf-8
require 'uri'
require 'yajl'
require 'rest_client'

require 'forrst/user/public_posts'

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
          @raw_data = Yajl::Parser.parse(response.body)['resp']
          @username = @raw_data['username']
          @id       = @raw_data['id'].to_i # Should be a Fixnum from the start
        end
      rescue RestClient::ResourceNotFound
        raise Exceptions::UserNotFound
      end
    end

    def public_posts
      @posts ||= PublicPosts.new(username)
      @posts.retrieve
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
