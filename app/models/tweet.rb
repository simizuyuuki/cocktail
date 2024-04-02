class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :recipe, :image,:text, presence: true 
end
