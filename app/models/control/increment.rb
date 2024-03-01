class Control::Increment < ApplicationRecord
  belongs_to :experiment
  def self.policy_class
    ControlPolicy
  end
  def type
    "increment"
  end
end
