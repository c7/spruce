# encoding: utf-8
require 'spruce'

module Forrst
  API_URI     = "http://api.forrst.com/api/"
  API_VERSION = 'v2'

  ## Sections of the Forrst API
  require 'forrst/user'

  ## Exceptions
  module Exceptions
    class InvalidUserId < ArgumentError
      def to_s
        'Invalid User ID, must be an Integer'
      end
    end

    class InvalidPostId < ArgumentError
      def to_s
        'Invalid Post ID, must be an Integer'
      end
    end

    class InvalidUsername < ArgumentError
      def to_s
        'Invalid username, must be a String'
      end
    end

    class UserNotFound < ArgumentError
      def to_s
        'User not found on Forrst'
      end
    end
  end
end
