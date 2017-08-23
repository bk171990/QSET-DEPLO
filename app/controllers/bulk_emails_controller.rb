class BulkEmailsController < ApplicationController
	before_action :load_batch ,only: [:selected_batched]

  def new
  	@bulk_email = BulkEmail.new
  end

  def index
    @bulk_emails = BulkEmail.all  	
  end

  def show	
  end

  def create
  	ids = []
    batch_id = Batch.find_by(id: params[:bulk_email][:batch_id])
    batch_id.present? && params[:student_ids].present? && params[:student_ids].each do |student_id|
      if Student.find(student_id.to_i)
        ids << student_id
       @bulk_email = BulkEmail.find_or_initialize_by(student_id: student_id.to_i, batch_id: params[:bulk_email][:batch_id],email_body: params[:bulk_email][:email_body],subject: params[:bulk_email][:subject]) 
       binding.pry
        UserMailer.send_email_students(@bulk_email).deliver_now
        @bulk_email.save  
      end
     end
     @students = Student.where(id: ids)
    redirect_to bulk_emails_path
   end
   
   def selected_batched
  	@students = @batch.students
   end

  private

    def load_batch
   	 @batch = Batch.find(params[:id])
    end
    
    def bulk_email_params
		params.require(:bulk_email).permit(:subject,:email_body,:student_id,:batch_id)
	end
end
