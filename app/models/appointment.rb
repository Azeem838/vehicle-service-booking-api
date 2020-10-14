class Appointment < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :user_id, presence: true
  validates :service_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
