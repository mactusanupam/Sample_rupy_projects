class TermsAndConditionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def create?
    user.super_admin?
  end

  def update?
    user.super_admin?
  end

  def destroy?
    create?
  end
end
