require_relative '../config/environment'


### start of dream team home page ##
def home
	system("clear")

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
def draft 
	prompt = TTY::Prompt.new

	puts "Welcome to the Dream Team Draft"
	prompt.select("Select your squad:", %w(Players Home))

end
home
#draft 
## end of draft page ##

