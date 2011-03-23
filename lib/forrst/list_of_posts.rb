# encoding: utf-8
require 'forrst/post'

module Forrst
  class ListOfPosts < Array
    attr_reader :status, :in, :authenticated, :authenticated_as, :environment, :raw_data

    def initialize(data)
        @status           = data['stat']
        @in               = data['in']
        @authenticated    = data['authed']
        @authenticated_as = data['authed_as']
        @environment      = data['env']
        @raw_data         = data
    end

    def add_post(post)
      self << post
    end
  end
end
