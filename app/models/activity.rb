class Activity < ApplicationRecord
  has_many :place_activities, dependent: :destroy
  has_many :places, through: :place_activities
  has_many :projects
end
