class Appointment < ApplicationRecord
  belongs_to :experiment
  belongs_to :user
  
  validate :user_has_no_overlap
  validate :experiment_has_no_overlap
  
  private
  
  def user_has_no_overlap
    if user.appointments.where.not(id: id).exists? && user.appointments.where.not(id: id).where("(start_time <= ? AND end_time >= ?) OR (start_time <= ? AND end_time >= ?)", start_time, start_time, end_time, end_time)
      errors.add(:user, "already has an appointment overlapping with this time")
    end
  end
  
  def experiment_has_no_overlap
    if experiment.appointments.where.not(id: id).exists? && experiment.appointments.where.not(id: id).where("(start_time <= ? AND end_time >= ?) OR (start_time <= ? AND end_time >= ?)", start_time, start_time, end_time, end_time)
      errors.add(:experiment, "already has an appointment overlapping with this time")
    end
  end
end
