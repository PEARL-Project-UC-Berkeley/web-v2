class Component::Stopwatch < ApplicationRecord
  belongs_to :experiment
  self.table_name = "component_stopwatches"
  def self.policy_class
    ComponentPolicy
  end
  def type
    "stopwatch"
  end
end
