require_relative '../config/environment'

## start of welcome page ##
def welcome
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
	home
end
## end of welcome page ##



## start of dream team home page ##
def home
	system("clear")

	prompt = TTY::Prompt.new

	puts "2k19 Dream Team"
	time = Time.new
	puts "Draft Day " + time.inspect

	choice = prompt.select("Ready to ball?") do |menu|
		menu.choice 'Enter Draft', 1
		menu.choice 'Exit', 2
	end

	if choice == 1
		enter_draft
	else
		exit_dt
	end
end
## end of home page ##



## start of draft page ##
def enter_draft 
	system("clear")
	prompt = TTY::Prompt.new

	puts "Welcome to the Dream Team Draft"
	choice = prompt.select("Create your Dream Team:") do |menu|
		menu.choice 'Draft a new Dream Team', 1
		menu.choice 'View Dream Team', 2
		menu.choice 'Trade Players', 3
		menu.choice 'Delete Dream Team', 4
		menu.choice 'Exit', 5
	end

	if choice == 1
		draft_point_guard
	elsif choice == 2
		view_dream_team
	elsif choice == 3
		update_positions	
	elsif choice == 4
		destroy_dt
	else
		exit_dt
	end			
end
## end of draft page ##



## new dream team ##
def new_dream_team(name)
	new_team = DreamTeam.new
	new_team.user_id = @@current_user.id
	new_team.player_id = Player.find_by(name: "#{name}").id
	new_team.save
end
## end new dream team ##



## start of point guard draft ##
def draft_point_guard
	system("clear")

	prompt = TTY::Prompt.new

	point_guard = ['Stephen Curry', 'Damian Lillard', 'Kyrie Irving', 'Russell Westbrook', { name: 'John Wall', disabled: '(injury)' }, 'Kemba Walker', 'Chris Paul', "D'Angelo Russell", "Mike Conley", "Jrue Holiday"]

	name = ""
	name = prompt.select('Choose your favorite Point Guard', point_guard, cycle: true)
	new_dream_team(name)
	draft_shooting_guard
	name
end
## end of point guard draft ##



## start of shooting guard draft ##
def draft_shooting_guard
	system("clear")

	prompt = TTY::Prompt.new
	
	shooting_guard = ['James Harden', 'Bradley Beal', 'Devin Booker', 'Jimmy Butler', 'Klay Thompson', 'DeMar DeRozan', 'Donovan Mitchell', 'Luka Doncic', { name: 'Victor Oladipo', disabled: '(injury)' }, 'Zach LaVine']

	name = ""
	name = prompt.select('Choose your favorite Shooting Guard', shooting_guard, cycle: true)
	new_dream_team(name)
	draft_small_forward
	name
end
## end of shooting guard draft ##



## start of the small forward draft ##
def draft_small_forward
	system("clear")

	prompt = TTY::Prompt.new
	
	small_forward = ['Giannis Antetokounmpo', 'LeBron James', 'Kawhi Leonard', 'Kevin Durant', 'Paul George', 'Ben Simmons', 'Danilo Gallinari', 'Jayson Tatum', 'Bojan Bogdanovic', { name: 'Brandon Ingram', disabled: '(injury)' }]

	name = ""
	name = prompt.select('Choose your favorite Small Forward', small_forward, cycle: true)
	new_dream_team(name)
	draft_power_forward
	name
end
## end of the small forward draft ##



## start of the power forward draft ##
def draft_power_forward
	system("clear")

	prompt = TTY::Prompt.new
	
	power_forward = ['Anthony Davis', { name: 'Kristaps Porzingis', disabled: '(injury)' }, 'LaMarcus Aldridge', 'Blake Griffin', 'Julius Randle', 'Pascal Siakam', 'Tobias Harris', 'Kevin Love', 'John Collins', 'Montrezl Harrell']

	name = ""
	name = prompt.select('Choose your favorite Power Forward', power_forward, cycle: true)
	new_dream_team(name)
	draft_center
	name
end
## end of the power forward draft ##



## start of the center draft ##
def draft_center
	system("clear")

	prompt = TTY::Prompt.new
	
	center = ['Joel Embiid', 'Nikola Jokic', 'Karl-Anthony Towns', 'Rudy Gobert', 'Andre Drummond', 'Clint Capela', 'Nikola Vucevic', 'Al Horford', 'DeMarcus Cousins', { name: 'Jusuf Nurkic', disabled: '(injury)' }]

	name = ""
	name = prompt.select('Choose your favorite Center', center, cycle: true)
	new_dream_team(name)
	confirm_dream_team
	name
end

## end of the center draft ##



## confirm the dream team ##
def confirm_dream_team
	system("clear")

	user_id = @@current_user.id
	user_dream_team = DreamTeam.where(user_id: user_id)
	player_id = user_dream_team.map {|object| object.player_id}
	player_name = player_id.map do |player|
		Player.find_by(id: "#{player}").name
	end

	prompt = TTY::Prompt.new

	puts "Here is the your Dream Team\n"
	puts "PG: #{player_name[0]}\n" "SG: #{player_name[1]}\n" "SF: #{player_name[2]}\n" "PF: #{player_name[3]}\n" "C: #{player_name[4]}\n"

	y_n = prompt.yes?("Is this the team you wanted?") 

	if y_n == true
		view_dream_team
	else y_n == false
		update_positions
	end

end
## end of confirm the dream team ##



## view dream team ##
def view_dream_team

	user_id = @@current_user.id
	user_dream_team = DreamTeam.where(user_id: user_id)
	player_id = user_dream_team.map {|object| object.player_id}
	player_name = player_id.map do |player|
		Player.find_by(id: "#{player}").name
	end
	puts "Here is your Dream Team"
	sleep 1
	puts "Starting Point Guard: #{player_name[0]}\n"
	sleep 1
	puts "Starting Shooting Guard: #{player_name[1]}\n"
	sleep 1
	puts "Starting Small Forward: #{player_name[2]}\n"
	sleep 1
	puts "Starting Power Forward: #{player_name[3]}\n"
	sleep 1
	puts "Starting Center: #{player_name[4]}"
	sleep 3
	home
end
## end view dream team ##


## destroy prompt ##



## end destroy prompt ##



# destroy Dream Team prompt##
def destroy_dt
	system("clear")

	prompt = TTY::Prompt.new

	y_n = prompt.yes?("Are you sure you want to delete your Dream Team?")

	if y_n == true
		user_id = @@current_user.id
		user_dream_team = DreamTeam.where(user_id: user_id)
		user_dream_team.destroy_all
		puts "Your Dream Team was successfully deleted"
		sleep 2
		home
	else y_n == false
		home
	end
end
## end destroy Dream Team ##


### update positions ###
def update_positions
	system("clear")
	
	prompt = TTY::Prompt.new

	choice = prompt.select("What Position do you need a new player") do |menu|
		menu.choice 'Point Guard', 1
		menu.choice 'Shooting Guard', 2
		menu.choice 'Small Forward', 3
		menu.choice 'Power Forward', 4
		menu.choice 'Center', 5
		menu.choice 'Done', 6
	end

	if choice == 1
		update_pg
	elsif choice == 2
		update_sg
	elsif choice == 3
		update_sf	
	elsif choice == 4
		update_pf
	elsif choice == 5
		update_c
	else choice == 6
		home
	end			
end
### update positions ###


## update pg ##
def update_pg
	system("clear")

	prompt = TTY::Prompt.new

	point_guard = ['Stephen Curry', 'Damian Lillard', 'Kyrie Irving', 'Russell Westbrook', { name: 'John Wall', disabled: '(injury)' }, 'Kemba Walker', 'Chris Paul', "D'Angelo Russell", "Mike Conley", "Jrue Holiday"]

	update = ""
	update = prompt.select('Choose your new Point Guard', point_guard, cycle: true)
	update_id = Player.find_by(name: update).id
	user_id = @@current_user.id
	user_dream_team = DreamTeam.where(user_id: user_id)
	user_dream_team[0].update(player_id: update_id)
	update_positions
end
## end update pg ##



## update sg ##
def update_sg
	system("clear")

	prompt = TTY::Prompt.new
	
	shooting_guard = ['James Harden', 'Bradley Beal', 'Devin Booker', 'Jimmy Butler', 'Klay Thompson', 'DeMar DeRozan', 'Donovan Mitchell', 'Luka Doncic', { name: 'Victor Oladipo', disabled: '(injury)' }, 'Zach LaVine']

	update = ""
	update = prompt.select('Choose your new Shooting Guard', shooting_guard, cycle: true)
	update_id = Player.find_by(name: update).id
	user_id = @@current_user.id
	user_dream_team = DreamTeam.where(user_id: user_id)
	user_dream_team[1].update(player_id: update_id)
	update_positions
end
## end update sg ##



## update sf ##
def update_sf
	system("clear")

	prompt = TTY::Prompt.new
	
	small_forward = ['Giannis Antetokounmpo', 'LeBron James', 'Kawhi Leonard', 'Kevin Durant', 'Paul George', 'Ben Simmons', 'Danilo Gallinari', 'Jayson Tatum', 'Bojan Bogdanovic', { name: 'Brandon Ingram', disabled: '(injury)' }]

	update = ""
	update = prompt.select('Choose your new Small Forward', small_forward, cycle: true)
	update_id = Player.find_by(name: update).id
	user_id = @@current_user.id
	user_dream_team = DreamTeam.where(user_id: user_id)
	user_dream_team[2].update(player_id: update_id)
	update_positions
end
## end update sf ##



## update pf ##
def update_pf
	system("clear")

	prompt = TTY::Prompt.new
	
	power_forward = ['Anthony Davis', { name: 'Kristaps Porzingis', disabled: '(injury)' }, 'LaMarcus Aldridge', 'Blake Griffin', 'Julius Randle', 'Pascal Siakam', 'Tobias Harris', 'Kevin Love', 'John Collins', 'Montrezl Harrell']

	update = ""
	update = prompt.select('Choose your new Power Forward', power_forward, cycle: true)
	update_id = Player.find_by(name: update).id
	user_id = @@current_user.id
	user_dream_team = DreamTeam.where(user_id: user_id)
	user_dream_team[3].update(player_id: update_id)
	update_positions
end
## end update pf ##



## update c ##
def update_c
	system("clear")

	prompt = TTY::Prompt.new
	
	center = ['Joel Embiid', 'Nikola Jokic', 'Karl-Anthony Towns', 'Rudy Gobert', 'Andre Drummond', 'Clint Capela', 'Nikola Vucevic', 'Al Horford', 'DeMarcus Cousins', { name: 'Jusuf Nurkic', disabled: '(injury)' }]

	update = ""
	update = prompt.select('Choose your new Center', center, cycle: true)
	update_id = Player.find_by(name: update).id
	user_id = @@current_user.id
	user_dream_team = DreamTeam.where(user_id: user_id)
	user_dream_team[4].update(player_id: update_id)
	update_positions
end
## end update c ##



## start of exit prompt ##
def exit_dt
	system("clear")
  	puts "Thanks for playing DT 2k19"
  	system("clear")
  	system("^C")
end
## end of exit prompt ##


welcome