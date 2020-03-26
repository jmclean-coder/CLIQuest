class Hero < ActiveRecord::Base 
    belongs_to :user
    has_many :hero_quests
    has_many :quests, through: :hero_quests
end