class Day < ApplicationRecord
    has_many :cards
    has_many :users, through: :cards

    def day_number
        "Day number #{self.id}!"
    end
end
