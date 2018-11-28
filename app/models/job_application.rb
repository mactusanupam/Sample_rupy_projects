class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :user
  
  #validates :document, attachment_presence: true
  validates :recruiter_comment, presence: true,length: { minimum: 10 }
  validates :status, presence: true
  has_attached_file :document
  #attr_accessor :document
  validates_attachment :document,presence: true, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
   # before_save :job_status_update
end
