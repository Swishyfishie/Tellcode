class User < ApplicationRecord
    has_secure_password

    has_many :cards
    has_many :days, through: :cards
    
    validates :username, presence: true
    validates :password, presence: true
    scope :created_today, ->(time) { where("created_at > ?", time) }


    def self.from_omniauth(auth)
      find_or_create_by(username: auth.info.nickname) do |user|
        user.username = auth.info.nickname
        user.id = auth.uid
        user.password = SecureRandom.hex
      end
    end
end
