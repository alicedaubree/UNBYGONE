class Place < ApplicationRecord
  has_many :projects
  belongs_to :user
  has_many_attached :photos
  validates :title, presence: true
  validates :description, presence: true
  validates :available_for, presence: true
  validates :type_of_place, presence: true
end
