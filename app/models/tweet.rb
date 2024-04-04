class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
  validates :name, :image,:text, presence: true 
  validates :text, length: { maximum: 168 }
end
