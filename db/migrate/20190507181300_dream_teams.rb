class DreamTeams < ActiveRecord::Migration[5.0]
  def change
  	create_table :dream_teams do |t|
			t.string :name
			t.boolean :win_loss
			t.integer :user_id
			t.integer :player_id
  end
end
