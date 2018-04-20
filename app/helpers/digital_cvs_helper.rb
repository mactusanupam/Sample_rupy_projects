module DigitalCvsHelper
  GENDER = {
    'f' => 'Female',
    'm' => 'Male',
    'o' => 'Other'
  }

  MARITAL_STATUS = {
    's' => 'Single',
    'm' => 'Married',
    'o' => 'Other'
  }

  def get_template
    Template.all
  end

  def get_company
    Company.all.collect {|p| [ p.name, p.id] } << ["Add New", ""]
  end

  def share_cv_url(digital_cv)
    protocol = Rails.env.development? ? 'http' : 'https'
    "#{protocol}://#{request.host_with_port}/digital-cvs/#{digital_cv.id}/share_and_download/#{digital_cv.slug}"
  end

  def all_sections
    mandatory_sections + optional_sections
  end

  def mandatory_sections
    %w(basic_information contact_details employment_details academic_details \
    languages_and_skills)
  end

  def optional_sections
    %w(trainings certifications honor_and_awards \
    research_or_project_details personal_details references)
  end

  def current_section
    res = unless params["digital_cv"].nil?
      section = params["digital_cv"].keys.select{|k| k.include? 'attributes'}.map{|a| a.gsub('_attributes', '')}
      section.empty? ? ['basic_information'] : section
    else
      params.keys.select{|k| k.include? 'detail'}.map(&:pluralize)
    end

    res.size > 1 ? 'languages_and_skills_form' : "#{res.first}_form"
  end

  def edit_url(cv)
    if request.format == 'js'
      'javascript:void(0)'
    else
      edit_digital_cv_path(cv)
    end
  end
end
