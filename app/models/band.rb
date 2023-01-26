class Band < ApplicationRecord

  has_many :members, dependent: :destroy
  has_many :users, through: :members

  has_many :musics, dependent: :destroy
  has_many :users, through: :musics

  validates :band_name, presence: true
  validates :mike_number, presence: true
end
