require_relative '../config/environment'



## start of welcome page ##
def user_name
	system("clear")

	prompt = TTY::Prompt.new

	puts "🏀 Welcome to 2k19 Dream Team! 🏀"
	puts "⛹ Choose your favorite ballers to battle head to head ⛹"

	User.all << prompt.ask("What is your name?") do |q|
		q.required true
		q.validate /\A\w+\Z/
		q.modify :capitalize
	end
end

def dream_team_name
	system("clear")

	prompt = TTY::Prompt.new

	dream_team_name = prompt.ask("What is the name of your Dream Team?") do |q|
		q.required true
		q.validate /\A\w+\Z/
		q.modify :capitalize
	end
end

## end of welcome page ##



## start of dream team home page ##
def home
	system("clear")

	prompt = TTY::Prompt.new

	puts "2k19 Dream Team"
	time = Time.new
	puts "Draft Day " + time.inspect

	prompt.select("Ready to ball?") do |menu|
		menu.choice 'Enter Draft', 1
		menu.choice 'View Dream Teams', 2
		menu.choice 'exit', 3
	end
end
## end of home page ##



## start of draft page ##
def enter_draft 
	system("clear")

	prompt = TTY::Prompt.new

	puts "Welcome to the Dream Team Draft"
	prompt.select("Create your Dream Team:") do |menu|
		menu.choice 'Draft a new Dream Team', 1
		menu.choice 'View Dream Team', 2
		menu.choice 'Trade Players', 3
		menu.choice 'Delete Dream Team', 4
		menu.choice 'Home', 5
	end

end
## end of draft page ##



## start of viewing free agents ##

# def view_free_agent
# 	system("clear")

# 	prompt = TTY::Prompt.new

# 	table = TTY::Table.new ['Point Guard','Shooting Guard', 'Small Forward', 'Power Forward', 'Center'], [['Stephen Curry', 'James Harden', 'Giannis Antetokounmpo', 'Anthony Davis', 'Joel Embiid'], ['Damian Lillard', 'Bradley Beal', 'LeBron James', 'Kristaps Porzingis', 'Nikola Jokic'], ['Kyrie Irving', 'Devin Booker', 'Kawhi Leonard', 'LaMarcus Aldridge', 'Karl-Anthony Towns'], ['Russell Westbrook', 'Jimmy Butler', 'Kevin Durant', 'Blake Griffin', 'Rudy Gobert'], ['John Wall', 'Klay Thompson', 'Paul George', 'Julius Randle', 'Andre Drummond'], ['Kemba Walker', 'DeMar DeRozan', 'Ben Simmons', 'Pascal Siakam', 'Clint Capela'], ['Chris Paul', 'Donovan Mitchell', 'Danilo Gallinari', 'Tobias Harris', 'Nikola Vucevic'], ["D'Angelo Russell", 'Luka Doncic', 'Jayson Tatum', 'Kevin Love', 'Al Horford'], ['Mike Conley', 'Victor Oladipo', 'Bojan Bogdanovic', 'John Collins', 'DeMarcus Cousins'], ['Jrue Holiday', 'Zach LaVine', 'Brandon Ingram', 'Montrezl Harrell', 'Jusuf Nurkic']]
# 	table
# end

## end of viewing free agents ##



## start of point guard draft ##
def draft_point_guard
	system("clear")

	prompt = TTY::Prompt.new

	point_guard = [
		'Stephen Curry',
		'Damian Lillard',
		'Kyrie Irving',
		'Russell Westbrook',
		{ name: 'John Wall', disabled: '(injury)' },
		'Kemba Walker',
		'Chris Paul',
		"D'Angelo Russell",
		"Mike Conley",
		"Jrue Holiday"
	]

	point_guard = prompt.select('Choose your favorite Point Guard', point_guard, cycle: true)
end
## end of point guard draft ##



## start of shooting guard draft ##
def draft_shooting_guard
	system("clear")

	prompt = TTY::Prompt.new
	
	shooting_guard = [
		'James Harden',
		'Bradley Beal',
		'Devin Booker',
		'Jimmy Butler',
		'Klay Thompson',
		'DeMar DeRozan',
		'Donovan Mitchell',
		'Luka Doncic',
		{ name: 'Victor Oladipo', disabled: '(injury)' },
		'Zach LaVine'
	]

	shooting_guard = prompt.select('Choose your favorite Shooting Guard', shooting_guard, cycle: true)
end
## end of shooting guard draft ##



## start of the small forward draft ##
def draft_small_forward
	system("clear")

	prompt = TTY::Prompt.new
	
	small_forward = [
		'Giannis Antetokounmpo',
		'LeBron James',
		'Kawhi Leonard',
		'Kevin Durant',
		'Paul George',
		'Ben Simmons',
		'Danilo Gallinari',
		'Jayson Tatum',
		'Bojan Bogdanovic',
		{ name: 'Brandon Ingram', disabled: '(injury)' }
	]

	small_forward = prompt.select('Choose your favorite Small Forward', small_forward, cycle: true)
end
## end of the small forward draft ##



## start of the power forward draft ##
def draft_power_forward
	system("clear")

	prompt = TTY::Prompt.new
	
	power_forward = [
		'Anthony Davis',
		{ name: 'Kristaps Porzingis', disabled: '(injury)' },
		'LaMarcus Aldridge',
		'Blake Griffin',
		'Julius Randle',
		'Pascal Siakam',
		'Tobias Harris',
		'Kevin Love',
		'John Collins',
		'Montrezl Harrell'
	]

	power_forward = prompt.select('Choose your favorite Power Forward', power_forward, cycle: true)
end
## end of the power forward draft ##



## start of the center draft ##
def draft_center
	system("clear")

	prompt = TTY::Prompt.new
	
	center = [
		'Joel Embiid',
		'Nikola Jokic',
		'Karl-Anthony Towns',
		'Rudy Gobert',
		'Andre Drummond',
		'Clint Capela',
		'Nikola Vucevic',
		'Al Horford',
		'DeMarcus Cousins',
		{ name: 'Jusuf Nurkic', disabled: '(injury)' }
	]

	center = prompt.select('Choose your favorite Center', center, cycle: true)
end
## end of the center draft ##



## create new dream team instance ##

def new_dream_team(team_name, pg, sg, sf, pf, c)
	DreamTeam.create(name: team_name, pg_id: pg, sg_id: sg, sf_id: sf, pf_id: pf, c_id: c)
end
## end new dream team instance



## view the dream team ##
def confirm_dream_team
	system("clear")
	prompt = TTY::Prompt.new

	puts "Here is the #{DreamTeam.all[0]}:\n"
	puts "PG: #{draft_point_guard}\n" "SG: #{draft_shooting_guard}\n" "SF: #{draft_small_forward}\n" "PF: #{draft_power_forward}\n" "C: #{draft_center}\n"

	prompt.yes?("Is this the team you wanted?") 
end
## end of view the dream team ##



user_name
dream_team_name
home
enter_draft
draft_point_guard
draft_shooting_guard
draft_small_forward
draft_power_forward
draft_center
confirm_dream_team
new_dream_team(dream_team_name, draft_point_guard, draft_shooting_guard, draft_small_forward, draft_power_forward, draft_center)

binding.pry
0
