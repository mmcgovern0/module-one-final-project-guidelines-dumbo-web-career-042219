class Player < ActiveRecord::Base

	has_many :dream_teams
	has_many :users, through: :dream_teams

end