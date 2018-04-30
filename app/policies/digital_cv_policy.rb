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

  def destroy?
    update?
  end

  def save_contact_detail?
    update?
  end

  alias :save_personal_detail? :save_contact_detail?

  def save_photo?
    update?
  end

  def update_name?
    update?
  end

  def change_cv_template?
    update?
  end

  def share_and_download?
    update?
  end
end
