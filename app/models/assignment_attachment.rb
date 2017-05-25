class AssignmentAttachment < ActiveRecord::Base
  belongs_to :assignment
   mount_uploader :file, FileUploader 
end
