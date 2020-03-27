class Monster < ActiveRecord::Base 
    has_many :quest_monsters
    has_many :quests, through: :quest_monsters
end
