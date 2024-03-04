class Experiment < ApplicationRecord
  has_many :camera_streams
  
  def controls
    Control.where(experiment_id: self.id)
  end

  def components
    Component.where(experiment_id: self.id)
  end
end
