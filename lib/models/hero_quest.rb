class HeroQuest < ActiveRecord::Base 
    belongs_to :hero 
    belongs_to :quest
end