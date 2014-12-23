require 'spec_helper'

describe "UsersSignups", :type => :request do
  describe "GET new_user" do
    it "should not create users with invalid signup info" do
      get :new_user
      assert_no_difference 'User.count' do
        post users_path, user: {
          name: '',
          email: 'blah@blach',
          password: 'poop',
          password_confirmation: 'boop'
        }
      end
      assert_template 'users/new'
    end
  end
end
