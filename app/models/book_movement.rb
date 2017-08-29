class BookMovement < ActiveRecord::Base
  belongs_to :book
  belongs_to :student
  belongs_to :batch
  belongs_to :course
  belongs_to :user
  belongs_to :employee
  belongs_to :library_setting
  has_many :fines
  has_many :return_books ,dependent: :destroy
  scope :shod, ->(id) { where(id: id).take }
  scope :particular_student_list, -> { where(book_movement: student_id)}

  def self.search_all(search)
    Student.where("first_name LIKE ? OR admission_no LIKE ?", "%#{search}%","%#{search}%") 
  end

  def self.search(search)
    if search 
      joins(:book,:student).where("books.book_number LIKE ? OR books.title LIKE ? OR students.admission_no LIKE ?", "%#{search}%","%#{search}%","%#{search}%") 
    else
      find(:all)
    end
  end
end
