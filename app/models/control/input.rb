class Control::Input < ApplicationRecord
  belongs_to :experiment
  def self.policy_class
    ControlPolicy
  end
  def type
    "input"
  end
end
