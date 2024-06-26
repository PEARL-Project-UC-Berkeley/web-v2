module Component
  def self.table_name_prefix
    "component_"
  end
  
  def self.new(submodule_name, *args)
    model = find_model(submodule_name)
    model.new(*args)
  end
  
  def self.create(submodule_name, *args)
    model = find_model(submodule_name)
    model.create(*args)
  end
  
  def self.find(id, *args)
    model = find_model(id.split("_")[0])
    model.find(id.split("_")[1], *args)
  end

  def self.where(*args, &block)
    [Component::Stopwatch].flat_map do |model|
      model.where(*args, &block)
    end.compact # Remove nil responses
  end
  
  def self.policy_class
    ControlPolicy
  end
  
  private
  
  def self.find_model(submodule_name)
    model_name = "Component::#{submodule_name.camelize}"
    Object.const_get(model_name)
  end
end
