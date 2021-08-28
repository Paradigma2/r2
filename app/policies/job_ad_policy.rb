class JobAdPolicy < ApplicationPolicy
  def create?
    registered?
  end

  def update?
    registered?
  end

  def destroy?
    registered?
  end
end