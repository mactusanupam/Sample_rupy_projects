class AddDefaultValueToRecruiterComment < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :job_applications,:recruiter_comment, from: nil, to: 'Application Received' 
  	change_column_default :job_applications, :status, from: nil, to: 'Applied' 

  end
end
