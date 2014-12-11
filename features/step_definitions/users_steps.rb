# users_steps.rb --- 
# Filename: users_steps.rb
# Description: 
# Author: Noah Peart
# Created: Wed Dec 10 22:07:06 2014 (-0400)
# Last-Updated: Wed Dec 10 22:09:28 2014 (-0400)
#           By: Noah Peart
# 
Given(/^the following users exist:$/) do |users_table|
  users_table.hashes.each do |user|
    User.create! user
  end
end

