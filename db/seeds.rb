Hero.destroy_all
Quest.destroy_all
User.destroy_all
Monster.destroy_all
HeroQuest.destroy_all
QuestMonster.destroy_all

30.times do
    Monster.create(name:Faker::Games::ElderScrolls.creature, level:rand(1..5), hit_points:rand(10..20), strength:rand(3..7), dexterity:rand(3..7), intellect:rand(3..5), alive: 1)
end

quest_names = ["A Village Is Under Attack!", "The Hunt Is On!", "Defeat the Boss!", "The Haunted Forest", "Under a Misty Mountain"]

10.times do
    Quest.create(quest_name: quest_names.sample, reward_gold:rand(10..30), reward_exp:rand(15..30))
end
puts "Done!!!"




