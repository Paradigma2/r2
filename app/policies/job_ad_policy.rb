class JobAdPolicy < ApplicationPolicy
  def create?
    registered?
  end

  def update?
    registered? && user == record&.user
  end

  def destroy?
    registered? && user == record&.user
  end
end