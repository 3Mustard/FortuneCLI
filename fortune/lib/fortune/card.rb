class Fortune::Card
	attr_accessor :name, :meaning
	@@all = []
	
	def initialize(name,meaning)
		@name = name
		@meaning = meaning
		@@all << self
	end 	

	def self.all
		@@all
	end

	def self.name_by_index(index)
		@@all[index].name
	end 

	def self.meaning_by_index(index)
		@@all[index].meaning
	end 
end 