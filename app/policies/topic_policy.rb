class TopicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    admin_or_super_admin?
  end

  def update?
    admin_or_super_admin?
  end

  def destroy?
    admin_or_super_admin?
  end

  def online_assessment?
    true
  end

  private

  def admin_or_super_admin?
    user && (user.admin? || user.super_admin?)
  end
end
