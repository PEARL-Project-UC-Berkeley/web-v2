class ComponentPolicy < ApplicationPolicy
  def index?
    true
  end
  def create?
    true
  end
  def show?
    true
  end
  def update?
    true
  end
  def edit?
    true
  end
  def destroy?
    true
  end
end