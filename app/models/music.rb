class Music < ApplicationRecord
  
  belongs_to :user
  belongs_to :band
  
  validates :music_name, presence: true
  validates :music_time, presence: true
  validates :band_id, presence: true
  
end
