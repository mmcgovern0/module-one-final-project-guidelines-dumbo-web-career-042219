class DreamTeam < ActiveRecord::Base

	belongs_to :user
	belongs_to :player

	@@all = []

	def self.all
		@@all
	end

end
