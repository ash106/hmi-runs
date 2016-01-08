class Run < ActiveRecord::Base
  belongs_to :user
  validates :date_of, :distance, presence: true
end
