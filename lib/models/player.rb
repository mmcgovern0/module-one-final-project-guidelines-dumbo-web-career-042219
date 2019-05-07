class Player < ActiveRecord::Base

	has_many :dream_teams
	has_many :users, through: :dream_teams



	## creates an array of player positions ##
	pg = ['Stephen Curry','Damian Lillard','Kyrie Irving','Russell Westbrook','John Wall','Kemba Walker','Chris Paul',"D'Angelo Russell","Mike Conley","Jrue Holiday"]
	sg = []
	sf = []
	pf = []
	c = []
	## ends an array of player positions ##



	## gets a point guard rating ##
	def get_pg_player_rating
		#https://www.2kratings.com
		output = {}
		ratings = Nokogiri::HTML(open("https://www.2kratings.com"))
		rating_tile = ratings.css("div.row div.col-sm-4 div.table-responsive.roster-table span.roster-rating.label")
	end
	## end of gets a point guard rating ##



	## creates an array of point guard ratings ##
	def pg_player_rating
		pg_ratings = []
		i = 0
		while i < 10 
			pg_ratings << get_pg_player_rating[i].to_s.slice(-10..-9)
			i += 1
		end
		pg_ratings
	end
	## end of an array of point guard ratings ##
	
end