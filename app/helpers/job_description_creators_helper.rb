module JobDescriptionCreatorsHelper
  def all_sections
   %w[overview job_details responsibility application_process]
  end

  def resp_type(num)
    type = case num
      when JobResponsibility::Type::OTHERS
        ''
      when JobResponsibility::Type::ORGANISATIONAL
        'Organizational Responsibilities'
      when JobResponsibility::Type::FUNCTIONAL
        'Functional Responsibilities'
      when JobResponsibility::Type::MANAGEMENT
        'Management Responsibilities'
    end
    type
  end
end
