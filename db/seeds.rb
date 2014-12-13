# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
more_trees = [
        {:plot => 1, :tag => 1000, :species => 'ABBA',
        :dbh => 10.5, :ht => 13.3},
        {:plot => 1, :tag => 99, :species => 'PIRU',
        :dbh => 5.4, :ht => 9},
        {:plot => 1, :tag => 120, :species => 'PIRU',
        :dbh => 1.5, :ht => 3.6}
            ]

# Create some random data
plot_max = 10
species = ['ABBA', 'PIRU', 'BECO']
id_max = 10000
dbh_max = 15
ht_max = 20
even_more_trees = []
1.upto(20).each do
  t = {:plot => rand(plot_max), :tag => rand(id_max),
  :species => species[rand(species.size)], :dbh => rand(0.1..dbh_max),
  :ht => rand(1.5..ht_max)}
  even_more_trees << t
end

more_trees << even_more_trees
more_trees.each do |tree|
  Tree.create!(tree)
end

# Create some users
users = [
  {name: "Noah", email: "noah.v.peart@gmail.com", password: "secret",
  password_confirmation: "secret"},
  {name: "Joesy", email: "812k_dlka@gmail.com", password: "secret",
  password_confirmation: "secret"},
  {name: "Jen", email: "kasfj_201@gmail.com", password: "secret",
  password_confirmation: "secret"},
]

users.each do |user|
  User.create!(user)
end

