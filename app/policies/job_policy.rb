class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user && (user.employer? || user.admin? || user.super_admin?)
  end

  def update?
    posted_user_or_admin?
  end

  def destroy?
    posted_user_or_admin?
  end

  def apply?
    true
  end

  def job_applied?
    posted_user_or_admin?
  end

  def job_application_update?
    posted_user_or_admin?
  end

  def job_status_update?
    posted_user_or_admin?
  end
  
  def suspicious_job?
    true
  end
    
  private

  def posted_user_or_admin?
    user && (record.user == user || user.admin? || user.super_admin? || user.employer?)
  end
end
