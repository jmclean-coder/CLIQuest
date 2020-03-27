class CliQuest
    def run
        welcome
        log_in_and_sign_up
        menu
    end
    
    def welcome
        puts "Welcome to CLI-Quest, A text based fighter RPG in your command line!".light_blue
    end

    def log_in_and_sign_up
        puts "What is your username?".light_blue
        username = gets.chomp
        @user = User.find_or_create_by(name:username)
    end

    def menu
        puts "Main Menu".light_blue
        puts "1. Create New Hero".light_blue
        puts "2. Load A Saved Hero".light_blue
        puts "3. Quit".light_blue

        input = gets.chomp

        case input
        when "1"
            hero_creation
        when "2"
            hero_menu
        when "3"
            puts "Another time, another adventure...".light_red
            exit 

        else
            puts "Sorry, that is not an option"
            menu
        #create new hero
        #load my heroes
        #exit (quit game) 
        end
    end

    def continue
        puts "When you are ready, press 'enter' to continue.".light_blue
        input = gets.strip
    end
        
    def hero_creation
        text = <<~TEXT.strip
        Hello new adventurer!
        You have a perilous journey ahead.
        What is your name, Hero?
        TEXT
        puts text
        hero_name = gets.chomp
        if @user.heroes.find_by(name: hero_name)
            puts "This hero is still alive and adventuring! Please enter a hero name.".red
            # puts "Enter 1 to go back?"
            hero_creation 
        else
            @hero = Hero.create(
                {name:hero_name, 
                level: 1, 
                exp: 0, 
                exp_til_level: 50, 
                hit_points: 10, 
                strength: 5,
                dexterity: 5,
                intellect: 5,
                luck: 5,
                alive: 1,
                gold: 100,
                user_id: @user.id}
                )
             @hero
        end
        hero_start
    end

    def hero_menu
        puts "Enter your hero's name to continue that hero's adventure.".light_blue
        @user.heroes.each do |hero|
            puts "#{hero.name}"
        end
        puts "------------------------------------"
        puts "1. Main Menu"
        input = gets.chomp
        
        if @user.heroes.find_by(name: input)
            @hero = @user.heroes.find_by(name: input)
            hero_start
        else
            puts "returning to menu".red
            menu
        end
    end

    def hero_start
        puts  <<~TEXT.strip
        Your thoughts drift to your last adventure, 
        reminding you of the battering you took. 
        What do you do next?
        TEXT
        puts "---------------------------------------"

        continue

        puts "1. Go on a Quest.".light_blue
        puts "2. Examine yourself.".light_blue
        puts "3. Main Menu.".light_blue
        puts "4. Level up.".yellow
        # puts "4. Look around you."
        input = gets.chomp

        case input 
        when "1"
            start_quest
        when "2"
            print hero_status
            hero_start
        when "3"
            menu
        when "4"
            level_up
        else
            puts "You scratch your head in confusion"
            hero_start
        end
    end

    def hero_status
        puts "Your name is #{@hero.name}."
        puts "You have #{@hero.exp} experience points."
        puts "You need #{@hero.exp_til_level} points to level up."
        puts "You have #{@hero.hit_points} hit points."
        puts "You have #{@hero.strength} strength."
        puts "You have #{@hero.dexterity} dexterity."
        puts "You have #{@hero.intellect} intellect."
        puts "You have #{@hero.luck} luck."
        puts "You have #{@hero.gold} gold"
    end

    def start_quest
        @quest = Quest.all.sample
        @monster = Monster.all.sample
        @hero_quest = HeroQuest.create(hero_id: @hero.id, quest_id: @quest.id)
        @monster_quest = QuestMonster.create(monster_id: @monster.id, quest_id: @quest.id)
        #binding.pry
        puts "You were notified of a quest called: #{@quest.quest_name} and chose to embark." 
        puts "If you succeed, you will recieve #{@quest.reward_gold} gold and #{@quest.reward_exp} experience."
        puts "Who knows what untold peril awaits you..."
        continue 
        fight
    end
    
    
    def fight
        @quest
        @monster_quest
        @hero_quest
        hero_total = hero_total_stats(@hero)
        monster_total = monster_total_stats(@monster)

        if hero_total > monster_total
            puts "You are massively more powerful than this #{@monster.name}. You emerge victorius!"
            puts "Quest complete! You have recieved #{@quest.reward_gold} gold and #{@quest.reward_exp} experience"

            @hero.gold += @quest.reward_gold
            @hero.exp += @quest.reward_exp
            @hero.save

            continue

            hero_start
        else monster_total > hero_total
            puts "You are overpowered by #{@monster.name}! OH NO!!!".light_red
            puts "You feel your life slowly ebb from your veins...".light_red
            puts "Cough...choke...*single tear*".light_red
            puts "This hero is no more".red
            hero_name = @hero.name
            Hero.all.find_by(name: hero_name).destroy

            continue

            menu
        end      
    end


    def hero_total_stats(hero)
        hero_total = hero.strength + hero.dexterity + hero.intellect
    end

    def monster_total_stats(monster)
        monster_total = monster.strength + monster.dexterity + monster.intellect
    end

    def level_up
        exp = @hero.exp
        req = @hero.exp_til_level
        
        if exp >= req
            puts "You have gained enough exp to level up!"
            char_update
        else
            puts "You need more experience!".red

            continue

            hero_start
        end  
    end

    def char_update
        @hero.level += 1
        @hero.exp = 0
        @hero.exp_til_level += 75
        @hero.hit_points += 5
        puts "Through training, hardship, and perhaps a few cheapshots".yellow
        puts "you have emerged victorius from many battles! Huzzah!".yellow
        puts "Your experiences have improved your stats".yellow
        puts "What do you wish to upgrade?".yellow
        
            continue
        
        @hero.save
        puts "1. Strength"
        puts "2. Dexterity"
        puts "3. Intellect"

            input = gets.chomp
            case input
            when "1"
                new_str = @hero.strength += 1
                @hero.update({strength: new_str})
            when "2"
                new_dex = @hero.dexterity += 1
                @hero.update({dexterity: new_dex})
            when "3"
                new_int = @hero.intellect += 1
                @hero.update({intellect: new_int})
            end
            @hero.save
            puts "You now have #{@hero.exp} experience points."
            puts "You now need #{@hero.exp_til_level} points to level up."
            puts "You now have #{@hero.hit_points} hit points."
            puts "You now have #{@hero.strength} strength."
            puts "You now have #{@hero.dexterity} dexterity."
            puts "You now have #{@hero.intellect} intellect."
            puts "You now have #{@hero.luck} luck."
            puts "You now have #{@hero.gold} gold"
            
                continue 

            hero_start
    end
 # @quest.hero_quests[0].hero targets hero
 # @quest.quest_monsters[0].monster targets monster
end
