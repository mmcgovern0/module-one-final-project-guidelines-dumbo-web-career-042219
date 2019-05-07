# require 'rest-client'
# require 'json'
# require 'pry'

class Player < ActiveRecord::Base

	has_many :dream_teams
	has_many :users, through: :dream_teams

end

	# attr_reader :free_agents, :drafted

	# players_string = RestClient.get('https://www.balldontlie.io/api/v1/players')
	# players_hash = JSON.parse(players_string)	

	# @@all = []
	# drafted = []

	# def initialize(first_name, last_name)
	# 	@first_name = first_name
	# 	@last_name = last_name
	# 	@@all << self
	# end

	# def self.all
	# 	@@all 
	# end


	# # def find_baller(baller)
	# # 	@players_hash["data"].each do |player_attr|
		
	# # 		if player_attr["first_name"].downcase == baller 
	# # 		free_agents << player
	# # 		end
	# # 	end
	# # 	free_agents
	# # end

	# def first_name_array
	# 	players_hash["data"].map do |player_attributes| #gets everything in array
	# 		player_attributes.select do |attribute| 
	# 			attribute["first_name"] #gets firstname array
	# 		end
	# 	end
	# end

	# def find_first_name(first_name)
	# 	self.first_name_array.find do |hash|
	# 		hash["first_name"] == first_name
	# 	end
	# end


	# def last_name_array
	# 	array = players_hash["data"].map do |player_attributes|
	# 		player_attributes.select do |attribute|
	# 			attribute["last_name"] == last_name
	# 		end
	# 	end
	# end


	# def full_name(first_name, last_name)
	# 	"#{first_name} #{last_name}"
	# end

	# binding.pry
#end