# encoding: utf-8
require 'forrst/list_of_posts'

module Forrst
  class User
    class PublicPosts
      attr_reader :posts, :username
      RESOURCE = "#{API_URI}#{API_VERSION}/users/posts"

      def retrieve
        return posts unless posts.nil?
        response = get("#{RESOURCE}?username=#{@username}")

        @posts = ListOfPosts.new(response)

        response['resp'].map { |p|
          @posts.add_post(Forrst::Post.new(p))
        }
        @posts
      end

      def initialize(username)
        raise Exceptions::InvalidUsername unless username.is_a? String
        @username = username
      end
    private
      def get(uri)
        begin
          response = RestClient.get uri
          Yajl::Parser.parse(response.body) if response.code == 200
        rescue RestClient::ResourceNotFound
          raise Exceptions::UserNotFound
        end
      end
    end
  end
end
