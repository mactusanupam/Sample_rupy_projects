class DigitalCvPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    update?
  end

  def create?
    true
  end

  def update?
    return record.id == cv.to_i unless user
    record.user_id == user.id
  end

  def edit?
    !!update?
  end

  def save_contact_detail?
    update?
  end
end
