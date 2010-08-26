require 'forrst/post'

module Forrst
  class User
    class Posts
      POSTS_RESOURCE = "#{API_URI}#{API_VERSION}/users/posts"
      
      attr_reader :posts, :raw_data, :posts_status
      
      def latest
        return @posts unless @posts.nil?
        
        uri = "#{POSTS_RESOURCE}?username=#{@username}"
        
        begin
          response = RestClient.get uri
          if response.code == 200
            @raw_data = Yajl::Parser.parse(response.body)
            @posts = @raw_data['resp']['posts'].map { |p| Forrst::Post.new(p) }
            @posts_status = @raw_data['resp']['stat']
          end
          
          @posts
        rescue RestClient::ResourceNotFound
          raise Exceptions::UserNotFound
        end
      end
      
      def before(post_id)
        raise Exceptions::InvalidPostId unless post_id.is_a? Fixnum
        self.new("#{POSTS_RESOURCE}?username=#{username}&last_id=#{post_id}")
      end
      
      def initialize(username)
        raise Exceptions::InvalidUsername unless username.is_a? String
        @username = username
      end
    end
  end
end