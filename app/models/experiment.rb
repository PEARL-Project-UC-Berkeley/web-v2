class Experiment < ApplicationRecord
  has_many :camera_streams
  has_many :controls
end
