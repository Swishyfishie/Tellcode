class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    has_many :cards
    has_many :days, through: :cards

    def self.from_omniauth(auth)
      find_or_create_by(username: auth.info.nickname) do |user|
        user.username = auth.info.nickname
        user.id = auth.uid
        user.password = SecureRandom.hex
      end
    end
end
