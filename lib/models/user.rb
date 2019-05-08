class User < ActiveRecord::Base

	has_many :dream_teams
	has_many :players, through: :dream_teams

	@@all = []

	def initialize(name)
		@name = name
		@@all << self
	end

	def self.all
		@@all
	end

end