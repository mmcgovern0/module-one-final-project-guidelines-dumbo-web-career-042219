require 'rest-client'
require 'json'

class Player

	players_string = RestClient.get('https://www.balldontlie.io/api/v1/players')
	players_hash = JSON.parse(players_string)

	free_agents = []
	drafted = []


	def find_baller(baller)
		player_hash[data].each do |player|
			if player["first_name"].downcase == baller 
			free_agents << player
			end
		end
		free_agents
	end

	def draft_baller(baller)
		player_hash[data].each do |player|
			if player["first_name"].downcase == baller 
			drafted << player
			end
		end
		drafted
	end

	def full_name(first_name, last_name)
		"#{first_name} #{last_name}"
	end

end