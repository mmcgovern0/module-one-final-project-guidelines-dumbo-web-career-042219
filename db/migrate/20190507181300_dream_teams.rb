class DreamTeams < ActiveRecord::Migration[5.0]
  def change
  	create_table :dream_teams do |t|		
			t.integer :player_id	#players primary key 
			t.integer :user_id	#users primary key
			t.boolean :win_loss
		end
	end
end
