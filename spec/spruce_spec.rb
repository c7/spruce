# encoding: utf-8
require File.expand_path('../spec_helper.rb', __FILE__)

describe "spruce" do
  it "should find a user by username" do
    user = Forrst::User.find('peterhellberg')
    user.id.must_equal 5079
  end

  it "should find a user by id" do
    user = Forrst::User.find(1)
    user.username.must_equal 'kyle'
  end

  it "should find a users public posts" do
    user = Forrst::User.find('peterhellberg')

    user.public_posts.status.must_equal 'ok'
    user.public_posts.environment.must_equal 'prod'
    user.public_posts.authenticated.must_equal false

    user.public_posts.each do |post|
      if post.tiny_id == 'yNS'
        post.post_type.must_equal 'code'
        break
      end
    end
  end
end
