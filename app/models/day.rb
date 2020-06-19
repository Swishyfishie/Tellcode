class Day < ApplicationRecord
    has_many :cards
    has_many :users, through: :cards

    # accepts_nested_attributes_for :cards

    def day_number
        "Day number #{self.id}!"
    end
    
    def self.search(search)
        if search
            day_number = Day.find_by(id: search)
        else 
            @days = Day.all
        end
    end
end
