class Experiment < ApplicationRecord
  has_one :camera_stream
  has_many :controls
end
