class CreateQuestMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :quest_monsters do |t|
      t.integer :quest_id
      t.integer :monster_id
      t.timestamps
    end
  end
end
