class Run < ActiveRecord::Base
  belongs_to :user
  validates :date_of, :distance, :user_id, presence: true
end
