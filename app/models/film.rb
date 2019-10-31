class Film < ApplicationRecord
    validates :title,  presence: true, length: { maximum: 50 }
    validates :year,  presence: true, length: { maximum: 4 }
    validates :director,  presence: true, length: { maximum: 50 }
end
