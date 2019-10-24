class Film < ApplicationRecord
    validates :title,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :year,  presence: true, length: { maximum: 4 }
    validates :director,  presence: true, length: { maximum: 50 }
end
