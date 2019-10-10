class Fortune::CLI

	def call
		Fortune::Scraper.get_card_data
		puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
		puts "@@                               @@"
		puts "@@ Welcome to CLI fortune teller @@"
		puts "@@                               @@"
		puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
		options
		menu
		exit_cli
	end 

	def options
		puts "+++++++++++++++++++++++++++++++++++"
		puts "++                               ++"
		puts "++ Please select an option.(0-2) ++"
		puts "++      1: Draw a card.          ++"
		puts "++      2. View all cards.       ++"
		puts "++      0. Exit.                 ++"
		puts "++                               ++"
		puts "+++++++++++++++++++++++++++++++++++"		
	end

	
	def menu
		input = nil
		while input != "0"
			input = gets.chomp
			case input
			when "1"
				draw_card
			when "2"
				list_cards
			when "menu"
				options
			else
				puts "I'm not sure what you meant. Type 'menu' for all options."
			end 
		end
	end 

	def exit_cli
        puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        puts "@@                                   @@"
        puts "@@ (∩ᄑ_ᄑ)⊃━☆ﾟ*･｡*･:≡(*･Goodbye!･｡) @@" 
        puts "@@                                   @@"
		puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	end 

	def list_cards
		Fortune::Card.all.each do |card| 
			puts "#{card.name}"
			puts "#{card.meaning}"
		end 
	end

	def draw_card
		index = rand 22
		puts "You drew #{Fortune::Card.name_by_index(index)}"
		puts "#{Fortune::Card.meaning_by_index(index)}"
	end
end 
