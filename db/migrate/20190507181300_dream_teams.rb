class DreamTeams < ActiveRecord::Migration[5.0]
  def change
  	create_table :dream_teams do |t|
			t.string :name		
			t.integer :pg_id	#players primary key 
			t.integer :sg_id	#players primary key 
			t.integer :sf_id	#players primary key 
			t.integer :pf_id	#players primary key 
			t.integer :c_id		#players primary key 
			t.boolean :win_loss
			t.integer :user_id	#users primary key
		end
	end
end
