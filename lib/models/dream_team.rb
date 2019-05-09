class DreamTeam < ActiveRecord::Base

	belongs_to :user
	belongs_to :player

	validate :player_count, :on => :create

	def player_count
		if self.user.players(:reload).count == 5
			errors.add(:base, "You already have your starting 5!")
		end
	end
end
