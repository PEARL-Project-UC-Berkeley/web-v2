class Control::PushButton < ApplicationRecord
  belongs_to :experiment
  def self.policy_class
    ControlPolicy
  end
  def type
    "push_button"
  end
end
