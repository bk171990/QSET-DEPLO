class Assignment < ActiveRecord::Base
  belongs_to :subject,class_name: 'Subject', foreign_key: :subject_id
  belongs_to :batch, class_name: 'Batch', foreign_key: :batch_id
  belongs_to :student
  mount_uploader :file
  scope :shod, ->(id) { where(id: id).take }
  has_many :assignment_attachments, dependent: :destroy
  accepts_nested_attributes_for :assignment_attachments
end
