# tree_spec.rb --- 
# Filename: tree_spec.rb
# Description: Tree model tests
# Author: Noah Peart
# Created: Wed Dec 10 18:52:58 2014 (-0400)
# Last-Updated: Wed Dec 10 19:21:41 2014 (-0400)
#           By: Noah Peart
# 

require 'spec_helper'

describe Tree do
  before(:each) do
    @valid_attributes = {
      :plot => 1,
      :tree_id => 1,
      :species => 'ABBA',
      :dbh => 5.5,
      :ht => 10.3,
      :notes => 'Leaning left'
    }
    @existing_tree = Tree.create(@valid_attributes)
  end

  it 'should enforce the uniqueness of tree ids within the same plot' do
    new_tree = Tree.new(:tree_id => 1, :plot => 1, :species => 'ABBA')
    new_tree.should_not be_valid
  end

  it 'should allow trees with the same id in different plots' do
    new_tree = Tree.new(:tree_id => 1, :plot => 2, :species => 'ABBA')
    new_tree.should be_valid
  end

end
