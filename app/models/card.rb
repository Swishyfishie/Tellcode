class Card < ApplicationRecord
    belongs_to :user
    belongs_to :day
    
    accepts_nested_attributes_for :day

    def card_created_at
        self.created_at.strftime("%d/%m/%Y")
    end
end
