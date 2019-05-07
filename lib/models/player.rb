class Player < ActiveRecord::Base

	has_many :dream_teams
	has_many :users, through: :dream_teams



	## creates an array of player positions ##
	pg = ['Stephen Curry', 'Damian Lillard', 'Kyrie Irving', 'Russell Westbrook', 'John Wall', 'Kemba Walker', 'Chris Paul', "D'Angelo Russell", 'Mike Conley', 'Jrue Holiday']
	sg = ['James Harden','Bradley Beal', 'Devin Booker', 'Jimmy Butler', 'Klay Thompson', 'DeMar DeRozan', 'Donovan Mitchell', 'Luka Doncic', 'Victor Oladipo', 'Zach LaVine']
	sf = ['Giannis Antetokounmpo', 'LeBron James', 'Kawhi Leonard', 'Kevin Durant', 'Paul George', 'Ben Simmons', 'Danilo Gallinari', 'Jayson Tatum', 'Bojan Bogdanovic', 'Brandon Ingram']
	pf = ['Anthony Davis', 'Kristaps Porzingis', 'LaMarcus Aldridge', 'Blake Griffin', 'Julius Randle', 'Pascal Siakam', 'Tobias Harris', 'Kevin Love', 'John Collins', 'Montrezl Harrell']
	c = ['Joel Embiid', 'Nikola Jokic', 'Karl-Anthony Towns', 'Rudy Gobert', 'Andre Drummond', 'Clint Capela', 'Nikola Vucevic', 'Al Horford', 'DeMarcus Cousins', 'Jusuf Nurkic']
	## ends an array of player positions ##



	## gets a point guard rating ##
	def get_pg_player_rating
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



	## gets a shooting guard rating ##
	def get_sg_player_rating
		ratings = Nokogiri::HTML(open("https://www.2kratings.com/top-50-shooting-guards-nba-2k19"))
		rating_tile = ratings.css("div.row div.col-xs-12 div.table-responsive.roster-table span.roster-rating.label")
	end
	## end of gets a shooting guard rating ##



	## creates an array of shooting guard ratings ##
	def sg_player_rating
		sg_ratings = []
		i = 0
		while i < 10 
			sg_ratings << get_sg_player_rating[i].to_s.slice(-10..-9)
			i += 1
		end
		sg_ratings
	end
	## end of an array of shooting guard ratings ##



	## gets a small forward rating ##
	def get_sf_player_rating
		ratings = Nokogiri::HTML(open("https://www.2kratings.com/top-50-small-forwards-nba-2k19"))
		rating_tile = ratings.css("div.row div.col-xs-12 div.table-responsive.roster-table span.roster-rating.label")
	end
	## end of gets a small forward rating ##



	## creates an array of small forward ratings ##
	def sf_player_rating
		sf_ratings = []
		i = 0
		while i < 10 
			sf_ratings << get_sf_player_rating[i].to_s.slice(-10..-9)
			i += 1
		end
		sf_ratings
	end
	## end of an array of small forward ratings ##



	## gets a power forward rating ##
	def get_pf_player_rating
		ratings = Nokogiri::HTML(open("https://www.2kratings.com/top-50-power-forwards-nba-2k19"))
		rating_tile = ratings.css("div.row div.col-xs-12 div.table-responsive.roster-table span.roster-rating.label")
	end
	## end of gets a power forward rating ##



	## creates an array of power forward ratings ##
	def pf_player_rating
		pf_ratings = []
		i = 0
		while i < 10 
			pf_ratings << get_pf_player_rating[i].to_s.slice(-10..-9)
			i += 1
		end
		pf_ratings
	end
	## end of an array of power forward ratings ##



	## gets a center rating ##
	def get_c_player_rating
		ratings = Nokogiri::HTML(open("https://www.2kratings.com/top-50-centers-nba-2k19"))
		rating_tile = ratings.css("div.row div.col-xs-12 div.table-responsive.roster-table span.roster-rating.label")
	end
	## end of gets a center rating ##



	## creates an array of center ratings ##
	def c_player_rating
		c_ratings = []
		i = 0
		while i < 10 
			c_ratings << get_c_player_rating[i].to_s.slice(-10..-9)
			i += 1
		end
		c_ratings
	end
	## end of an array of center ratings ##
end