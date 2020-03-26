class CreateHeroQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :hero_quests do |t|
      t.integer :hero_id
      t.integer :quest_id
      t.timestamps
    end
  end
end
