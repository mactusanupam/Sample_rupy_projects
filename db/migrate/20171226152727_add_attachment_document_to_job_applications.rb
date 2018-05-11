class AddAttachmentDocumentToJobApplications < ActiveRecord::Migration[5.1]
  def self.up
    change_table :job_applications do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :job_applications, :document
  end
end
