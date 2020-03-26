class Monsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :level
      t.integer :hit_points
      t.integer :strength
      t.integer :dexterity
      t.integer :intellect
      t.boolean :alive
      t.timestamps
    end
  end
end
