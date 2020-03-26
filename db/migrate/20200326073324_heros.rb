class Heros < ActiveRecord::Migration[5.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :gender
      t.integer :level
      t.integer :exp
      t.integer :exp_til_level
      t.integer :hit_points
      t.integer :strength
      t.integer :dexterity
      t.integer :intellect
      t.integer :luck
      t.boolean :alive
      t.timestamps
    end
  end
end
