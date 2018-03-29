module DigitalCvsHelper
  def get_template
    Template.all
  end

  def get_Company
    Company.all.collect {|p| [ p.name, p.id] } << ["Others", ""]
  end

  def share_cv_url(digital_cv)
    protocol = Rails.env.development? ? 'http' : 'https'
    "#{protocol}://#{request.host_with_port}/digital-cvs/#{digital_cv.id}/share_and_download/#{digital_cv.slug}"
  end
end
