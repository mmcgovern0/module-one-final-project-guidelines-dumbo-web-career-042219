require_relative '../config/environment'

## start of welcome page ##
def welcome
	system("clear")

	prompt = TTY::Prompt.new

	puts "Welcome to 2k19 Dream Team!"
	puts "Choose your favorite ballers to battle head to head"

	prompt.ask("What is your name?") do |q|
		q.required true
		q.validate /\A\w+\Z/
		q.modify :capitalize
	end 	

end

## end of welcome page ##



## start of dream team home page ##
def home
	

	prompt = TTY::Prompt.new

	puts "2k19 Dream Team"
	time = Time.new
	puts "Draft Day " + time.inspect

	prompt.select("Ready to ball?") do |menu|
		menu.choice 'Enter Draft', 1
		menu.choice 'Free Agents', 2
		menu.choice 'exit', 3
	end
end
## end of home page ##



## start of draft page ##
def enter_draft 
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

	prompt.select('Choose your favorite Point Guard', point_guard, cycle: true)
end
## end of point guard draft ##



## start of shooting guard draft ##
def draft_shooting_guard

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

	prompt.select('Choose your favorite Shooting Guard', shooting_guard, cycle: true)
end
## end of shooting guard draft ##



## start of the small forward draft ##
def draft_small_forward

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

	prompt.select('Choose your favorite Small Forward', small_forward, cycle: true)
end
## end of the small forward draft ##



## start of the power forward draft ##
def draft_power_forward

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

	prompt.select('Choose your favorite Power Forward', power_forward, cycle: true)
end
## end of the power forward draft ##



## start of the center draft ##
def draft_center

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

	prompt.select('Choose your favorite Center', center, cycle: true)
end
## end of the center draft ##
welcome
home 
enter_draft
draft_point_guard
draft_shooting_guard
draft_small_forward
draft_power_forward
draft_center
