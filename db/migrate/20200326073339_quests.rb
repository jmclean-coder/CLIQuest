class Quests < ActiveRecord::Migration[5.0]
  def change
    create_table :quests do |t|
    t.string :quest_name
    t.text :location
    t.text :description
    t.integer :reward_gold
    t.integer :reward_exp
    t.timestamps
    end
  end
end
