module StaticPagesHelper
  def resume_features
    {
      'download formats'   => 'Download Formats',
      'resume templates'   => 'Resume Templates',
      'photo cv templates' => 'Photo CV Template',
      'multiple download'  => 'Multiple download',
      #'linkedin import'    => 'Import from LinkedIn Profile',
      'email support'      => 'Priority email Support',
      'cover letter'       => 'Create a Cover letter for each Resume',
      'multiple resumes'   => 'Create and Manage Multiple Resumes',
      'custom url'         => 'Custom URL to share your resume online',
      'analytics'          => 'Analytics to track who viewed and/or downloaded your online resume'

   }
  end

  def plan_price_text(plan)
    price = number_to_currency(plan.plan_price).to_s

    price += if plan.plan_frequency == 'quarterly'
      '/quarter'
    else
      '/resume'
    end
  end

  def plan_feature_value(fv)
    if fv == true
      fa_icon 'check-circle 2x', class: 'icon-green'
    elsif fv == false
      fa_icon 'times 2x', class: 'icon-red'
    else
      fv
    end
  end
end
