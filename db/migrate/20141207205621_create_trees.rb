class CreateTrees < ActiveRecord::Migration
  def up
    create_table :trees do |t|
      t.integer :plot
      t.integer :tag
      t.string :species
      t.decimal :dbh
      t.decimal :ht
      t.timestamps
    end
  end

  def down
    drop_table :trees
  end
end
