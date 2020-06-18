class Card < ApplicationRecord
    belongs_to :user
    belongs_to :day
    validates :youtube_link, presence: true
    validates :codewars_link, presence: true
    validates :article_link, presence: true

    accepts_nested_attributes_for :day

    def card_created_at
        self.created_at.strftime("%d/%m/%Y")
    end
end
