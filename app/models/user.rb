class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :musics
  
  has_one_attached :image
  
  validates :email, presence: true
  validates :name, presence: true
  validates :nickname, presence: true

end
