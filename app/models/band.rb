class Band < ApplicationRecord

  has_many :members
  has_many :users, through: :members

  has_many :musics
  has_many :users, through: :musics

  validates :band_name, presence: true
  validates :mike_number, presence: true
end
