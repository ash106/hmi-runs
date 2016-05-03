class Workout < ActiveRecord::Base
  belongs_to :user
  validates :date_of, :length, :user_id, presence: true
end
