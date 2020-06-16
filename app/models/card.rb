class Card < ApplicationRecord
    belongs_to :user
    belongs_to :day
    

    def card_created_at
        self.created_at.strftime("%d/%m/%Y")
    end
end
