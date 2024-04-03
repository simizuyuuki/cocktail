class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
         
         has_many :tweets
         has_one_attached :image
end
