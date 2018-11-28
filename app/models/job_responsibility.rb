class JobResponsibility < ApplicationRecord
  belongs_to :job_title

  class Type
    FUNCTIONAL      = 1
    ORGANISATIONAL  = 2
    MANAGEMENT      = 3
    OTHERS          = 0
  end

  def resp_type
    return '' if responsibility_type == (Type::OTHERS || '')
    return 'Functional' if responsibility_type == Type::FUNCTIONAL
    return 'Organizational' if responsibility_type == Type::ORGANISATIONAL
    return 'Management' if responsibility_type == Type::MANAGEMENT
  end
end
