class Workout < ActiveRecord::Base
  belongs_to :user
  validates :date_of, :length, presence: true
end
