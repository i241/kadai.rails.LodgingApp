class Inn < ApplicationRecord
  belongs_to :user
  has_many :reservations
  attachment :image
end
