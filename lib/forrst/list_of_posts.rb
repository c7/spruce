require 'forrst/post'

module Forrst
  class ListOfPosts < Array
    attr_accessor :status, :raw_data
    
    def add_post(post)
      self << post
    end
  end
end