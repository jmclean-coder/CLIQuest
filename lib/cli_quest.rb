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
        puts "What is your username?"
        username = gets.chomp
        @user = User.find_or_create_by(name:username)
    end

    def menu
        puts "Main Menu"
        puts "1. Create New Hero"
        puts "2. Load A Saved Hero"
        puts "3. Quit"

        input = gets.chomp

        case input
        when "1"
            hero_creation
        when "2"
            hero_menu
        when "3"
            puts "Another time, another adventure..."
            exit 

        else
            puts "Sorry, that is not an option"
            menu
        #create new hero
        #load my heroes
        #exit (quit game) 
        end
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
            puts "This hero is still alive and adventuring! Please enter a new hero name."
            # puts "Enter 1 to go back?"
            hero_creation 
        else
            @hero = Hero.create(
                {name:hero_name, 
                level: 1, 
                exp: 0, 
                exp_til_level: 50, 
                hit_points: 10, 
                strength: 1,
                dexterity: 1,
                intellect: 1,
                luck: 1,
                alive: 1,
                gold: 100,
                user_id: @user.id}
                )
            end
    end

    def hero_menu
        puts "Enter your hero's name to continue that hero's adventure."
        @user.heroes.each do |hero, n|
            n = 0
            puts "#{hero.name}"
        end
        puts "------------------------------------"
        puts "1. Main Menu"
        input = gets.chomp
        
        if @user.heroes.find_by(name: input)
            quest_hub
        else
            puts "invalid option, returning to menu".light_red
            menu
        end
    end

    def quest_hub
end
