class AppointmentPolicy < ApplicationPolicy
  def index?
    true
  end
  def create?
    user.is_admin? || record.user == user
  end
  def show?
    user.is_admin? || record.user == user
  end
  def update?
    user.is_admin? || record.user == user
  end
  def edit?
    user.is_admin? || record.user == user
  end
  def destroy?
    user.is_admin? || record.user == user
  end
  def admin?
    user.is_admin?
  end
end