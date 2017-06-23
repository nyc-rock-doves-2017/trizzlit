class Deck < ApplicationRecord
  belongs_to :creator_id, class_name: :User
  has_many :cards

  validates :category, :private, :creator_id, presence: true
  
end
