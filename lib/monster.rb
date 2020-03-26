class Monster < ActiveRecord::Base 
    has_many :quest_monsters
    has_many :quests, through: :quests_monsters
end

#args_hash = {name: "Goblin", level: 5, hit_points: 30, strength: 5, dexterity: 4, intellect: 3, alive: 1}