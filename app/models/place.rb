class Place < ApplicationRecord
  has_many :projects
  belongs_to :user
  has_many_attached :photos
end
