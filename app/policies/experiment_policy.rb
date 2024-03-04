class ExperimentPolicy < ApplicationPolicy
  def index?
    true
  end
  def create?
    user.is_admin?
  end
  def show?
    true
  end
  def update?
    user.is_admin?
  end
  def edit?
    user.is_admin?
  end
  def destroy?
    user.is_admin?
  end
end