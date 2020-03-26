class QuestMonster < ActiveRecord::Base 
    belongs_to :quest 
    belongs_to :monster
end