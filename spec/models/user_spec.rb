require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => 'Bob',
      :password => 'secret',
      :email => "bob@gmail.com"
    }
    @valid_addresses = %w[user@example.com USER@foo.com A_US-ER@goo.bar.org
                         first.last@foo.jp allice+bob@baz.cn]
    @invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    @existing_user = User.create(@valid_attributes)
  end

  it 'should enforce the uniqueness of a user email' do
    new_user = User.new(:name => 'Barney', :email => 'bob@gmail.com',
      :password => 'secret')
    new_user.should_not be_valid
  end

  it 'should check email addresses are case-insensitive' do
    new_user = User.new(:name => 'Barney', :email => 'BOB@gmAil.com',
      :password => 'secret')
    new_user.should_not be_valid
  end
  
  it 'should allow users with the same name but different passwords' do
    new_user = User.new(:name => 'Bob', :email => 'bob420@gmail.com',
      :password => 'secret')
  end
  
  it 'should enforce that new entry contains a user name' do
    new_user = User.new(:password => 'secret')
    new_user.should_not be_valid
  end

  it 'should enforce that a new entry has a password' do
    new_user = User.new(:name => 'Sally')
    new_user.should_not be_valid
  end

  it 'should enforce passwords to be at least 6 characters' do
    new_user = User.new(:name => 'Sally', :email => 'sallio@gmail.com',
      :password => 'abcde')
    new_user.should_not be_valid
  end

  it 'should allow valid email addresses' do
    @valid_addresses.each do |valid_address|
      @existing_user.email = valid_address
      @existing_user.should be_valid
    end
  end

  it 'should not allow invalid addresses' do
    @invalid_addresses.each do |invalid_address|
      @existing_user.email = invalid_address
      @existing_user.should_not be_valid
    end
  end
  
end
