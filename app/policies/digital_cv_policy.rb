class DigitalCvPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    owner_or_admin?
  end

  def create?
    true
  end

  def update?
    owner_or_admin?
  end

  def edit?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  def save_contact_detail?
    owner_or_admin?
  end

  alias :save_personal_detail? :save_contact_detail?

  def save_photo?
    owner_or_admin?
  end

  def update_name?
    owner_or_admin?
  end

  def change_cv_template?
    owner_or_admin?
  end

  def share_and_download?
    owner_or_admin?
  end
  def download_cv_docx?
    owner_or_admin?
  end

  def download_cv_docx?
    owner_or_admin?
  end

  private

  def owner_or_admin?
    unless user
      record.id == cv.to_i
    else
      user.admin? || user.super_admin? || record.user_id == user.id
    end
  end
end
