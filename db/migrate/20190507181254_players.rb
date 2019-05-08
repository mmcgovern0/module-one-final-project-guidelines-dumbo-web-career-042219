class Players < ActiveRecord::Migration[5.0]
  	def change
  		create_table :players do |t|
			t.string :name
			t.string :position
			t.integer :rating
		end
	end
end
