# encoding: utf-8
require 'time'

module Forrst
  class Post
    attr_accessor :raw_data

    def initialize(data)
      populate(data)
    end

    def populate(data)
      # Save the raw data hash
      @raw_data = data

      # Standard fields
      standard_fields = [
        'slug', 'tag_string', 'tiny_id', 'faved_by_current_user', 'title',
        'markdown_description', 'markdown_content', 'reply_key', 'reply_url',
        'current_user_likes_this', 'url', 'url_with_wbr', 'post_type',
        'in_reply_to_post_id', 'post_url', 'phrase', 'formatted_description',
        'tag_objs', 'tags', 'images', 'snap_content_type',
      ]

      # Numeric fields such as like count and number of views
      numeric_fields = [
        'like_count', 'views', 'is_public', 'id', 'comment_count',
        'short_url_redirects', 'user_id', 'snap_file_size'
      ]

      # Date fields
      date_fields = [
        'created_at', 'updated_at', 'snap_updated_at'
      ]

      standard_fields.map { |f| instance_variable_set("@#{f}", data[f]) }
      numeric_fields.map  { |f| instance_variable_set("@#{f}", data[f].to_i) }
      date_fields.map     { |f| instance_variable_set("@#{f}", f.match(/\d\d\d\d/) ? Time.parse(data[f]) : nil) }

      # Define accessor methods
      (class << self; self; end).class_eval do
        # Handle the standard fields
        (standard_fields + numeric_fields + date_fields).each do |field|
          define_method "#{field}" do
            instance_variable_get("@#{field}")
          end
        end
      end
    end
  end
end
