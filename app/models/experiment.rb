class Experiment < ApplicationRecord
  has_many :camera_streams
  has_many :appointments
  
  def controls
    Control.where(experiment_id: self.id)
  end

  def components
    Component.where(experiment_id: self.id)
  end
end
