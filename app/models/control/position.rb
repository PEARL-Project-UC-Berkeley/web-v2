class Control::Position < ApplicationRecord
  belongs_to :experiment
  def self.policy_class
    ControlPolicy
  end
  def type
    "position"
  end
end
