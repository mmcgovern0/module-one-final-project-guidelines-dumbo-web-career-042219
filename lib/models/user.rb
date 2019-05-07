class User < ActiveRecord::Base

	has_many :dream_teams
	has_many :players, through: :dream_teams

end