class Project < ApplicationRecord
  belongs_to :user
  belongs_to :place
  belongs_to :activity
end
