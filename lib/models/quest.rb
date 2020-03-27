class Quest < ActiveRecord::Base 
    has_many :hero_quests
    has_many :heroes, through: :hero_quests
    has_many :quest_monsters
    has_many :monsters, through: :quest_monsters
end