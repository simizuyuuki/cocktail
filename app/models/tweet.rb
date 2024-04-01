class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :title, :recipe, :image, presence: true 
end
