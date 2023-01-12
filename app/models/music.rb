class Music < ApplicationRecord
  
  belongs_to :user
  
  validates :song1_name, presence: true
  validates :song1_time, presence: true
  validates :band_name, presence: true
  validates :mike_number, presence: true
  validates :status, presence: true
  
end
