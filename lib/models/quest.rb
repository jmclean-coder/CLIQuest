class Quest < ActiveRecord::Base 
    has_many :hero_quests
    has_many :heroes, through: :hero_quests
    has_many :hero_quests
    has_many :monsters, through: :monster_quests
end