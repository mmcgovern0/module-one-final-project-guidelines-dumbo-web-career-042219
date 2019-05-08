require_relative '../config/environment'



## start of welcome page ##
def user_name
	system("clear")

	prompt = TTY::Prompt.new
	username = ""

	puts "🏀 Welcome to 2k19 Dream Team! 🏀"
	puts "⛹ Choose your favorite ballers to battle head to head ⛹"

	prompt.collect do 
		username = key(:name).ask("What is your name?", required: true, validate: /\A\w+\Z/)
	end
	User.create(name: username)
	@@current_user = User.find_by(name: username)
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
	name = ""
	name = prompt.select('Choose your favorite Point Guard', point_guard, cycle: true)
	# binding.pry
	new_team = DreamTeam.new
	new_team.user_id = @@current_user.id
	new_team.player_id = Player.find_by(name: "#{name}").id
	new_team.save
	name
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

	name = ""
	name = prompt.select('Choose your favorite Shooting Guard', shooting_guard, cycle: true)
	new_team = DreamTeam.new
	new_team.user_id = @@current_user.id
	new_team.player_id = Player.find_by(name: "#{name}").id
	new_team.save
	name
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

	name = ""
	name = prompt.select('Choose your favorite Small Forward', small_forward, cycle: true)
	new_team = DreamTeam.new
	new_team.user_id = @@current_user.id
	new_team.player_id = Player.find_by(name: "#{name}").id
	new_team.save
	name
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

	name = ""
	name = prompt.select('Choose your favorite Power Forward', power_forward, cycle: true)
	new_team = DreamTeam.new
	new_team.user_id = @@current_user.id
	new_team.player_id = Player.find_by(name: "#{name}").id
	new_team.save
	name
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

	name = ""
	name = prompt.select('Choose your favorite Center', center, cycle: true)
	new_team = DreamTeam.new
	new_team.user_id = @@current_user.id
	new_team.player_id = Player.find_by(name: "#{name}").id
	new_team.save
	name
end
## end of the center draft ##



## create new dream team instance ##
# def new_dream_team(player_id)
# 	DreamTeam.create(player_id: @player)
# end
## end new dream team instance



## view the dream team ##
def confirm_dream_team(pg, sg, sf, pf, c)
	system("clear")
	prompt = TTY::Prompt.new

	puts "Here is the your Dream Team\n"
	puts "PG: #{pg}\n" "SG: #{sg}\n" "SF: #{sf}\n" "PF: #{pf}\n" "C: #{c}\n"

	prompt.yes?("Is this the team you wanted?") 
end
## end of view the dream team ##



user_name
home
enter_draft
pg = draft_point_guard
sg = draft_shooting_guard
sf = draft_small_forward
pf = draft_power_forward
c = draft_center
confirm_dream_team(pg, sg, sf, pf, c)


