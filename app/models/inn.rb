class Inn < ApplicationRecord
  belongs_to :user
  has_many :reservations
  attachment :image
  
  def self.search(search)
      if search
        Inn.where(['title LIKE ?', "%#{search}%"])
        Inn.where(['address LIKE ?', "%#{search}%"])
      else
        Inn.all
      end
    end
end
