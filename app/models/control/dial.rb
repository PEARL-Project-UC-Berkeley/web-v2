class Control::Dial < ApplicationRecord
  belongs_to :experiment
  def self.policy_class
    ControlPolicy
  end
  def type
    "dial"
  end
end
