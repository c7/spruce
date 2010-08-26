require 'forrst/list_of_posts'

module Forrst
  class User
    class PublicPosts
      RESOURCE = "#{API_URI}#{API_VERSION}/users/posts"
      
      def latest
        return @posts unless @posts.nil?
        response = get("#{RESOURCE}?username=#{@username}")
        
        @posts = ListOfPosts.new
        response['resp']['posts'].map { |p| 
          @posts.add_post(Forrst::Post.new(p)) 
        }
        @posts.status = response['resp']['stat']
        @posts.raw_data = response
        
        @posts
      end
      
      def before(post_id)
        raise Exceptions::InvalidPostId unless post_id.is_a? Fixnum
        response = get("#{RESOURCE}?username=#{@username}&last_id=#{post_id}")
        
        posts = ListOfPosts.new
        response['resp']['posts'].map { |p| 
          posts.add_post(Forrst::Post.new(p))
        }
        posts.status = response['resp']['stat']
        posts.raw_data = response
        
        posts
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