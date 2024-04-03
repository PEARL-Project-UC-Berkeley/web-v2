class Appointment < ApplicationRecord
  belongs_to :experiment
  belongs_to :user

  # validates :start_time, :end_time, :overlap => {:scope => "experiment_id"}
  validates :start_time, :end_time, :overlap => {:scope => "user_id"}

end
