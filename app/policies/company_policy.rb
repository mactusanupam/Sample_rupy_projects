class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user && (admin_user? || other_user?)
  end

  def update?
    company_or_admin_user?
  end

  def destroy?
    company_or_admin_user?
  end

  def search?
    true
  end

  private

  def company_or_admin_user?
    user && (company_user? || admin_user?)
  end

  def company_user?
    (user.corporate_user? || user.recruiter?) && user.company == record
  end

  def admin_user?
    user.admin? || user.super_admin?
  end

  def other_user?
    user.other_user?
  end
end
