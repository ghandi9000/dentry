# tree.rb --- 
# Filename: tree.rb
# Description: Tree model
# Author: Noah Peart
# Created: Sun Dec  7 16:51:13 2014 (-0400)
# Last-Updated: Wed Dec 10 19:11:21 2014 (-0400)
#           By: Noah Peart
# 
class Tree < ActiveRecord::Base
  # attr_accessible :tree_id, :species, :dbh, :ht, :notes
  validates_uniqueness_of :tree_id, scope: :plot
  validates_presence_of :tree_id, :plot, :species
  
  def self.get_all_plots
    self.select('DISTINCT plot').map(&:plot)
  end
  def self.get_all_species
    self.select('DISTINCT species').map(&:species)
  end
end
