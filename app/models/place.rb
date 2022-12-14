class Place < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :place_activities, dependent: :destroy
  has_many :activities, through: :place_activities
  belongs_to :user
  has_many_attached :photos
  validates :photos, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :available_for, presence: true
  validates :type_of_place, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
