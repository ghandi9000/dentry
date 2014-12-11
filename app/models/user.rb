# user.rb --- 
# Filename: user.rb
# Description: Models a user, email address must be unique for login
# Author: Noah Peart
# Created: Wed Dec 10 20:12:49 2014 (-0400)
# Last-Updated: Thu Dec 11 03:28:08 2014 (-0400)
#           By: Noah Peart
# 
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: {case_sensitive: false}, 
  length: {maximum: 50}, format: {with: VALID_EMAIL_REGEX}  
  validates :name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}

  def self.all_users
    self.select('DISTINCT name').map(&:name)
  end

  def self.all_emails
    self.select('DISTINCT email').map(&:email)
  end
  
end
