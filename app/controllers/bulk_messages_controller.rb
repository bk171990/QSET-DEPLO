class BulkMessagesController < ApplicationController
		before_action :load_batch ,only: [:selected_batch]

	def new
		@bulk_message = BulkMessage.new
		@batches = Batch.all
	end

  
	 def create
    ids = []
    batch_id = Batch.find_by(id: params[:bulk_message][:batch_id])
    batch_id.present? && params[:student_ids].present? && params[:student_ids].each do |student_id|
      if Student.find(student_id.to_i)
        ids << student_id
        bulk_message = BulkMessage.find_or_initialize_by(student_id: student_id.to_i, batch_id: params[:bulk_message][:batch_id])
        bulk_message.body = params[:bulk_message][:body]
        bulk_message.save
      end
    end
    @students = Student.where(id: ids)
    redirect_to bulk_messages_path
  end

  def selected_batch
  	@students = @batch.students
  end

  def selected_type
    
  end

  def sms
    
  end

  def index
    @bulk_messages = BulkMessage.all
  end


	private

	 def load_batch
   	 @batch = Batch.find(params[:id])
   end


	def params_bulk_message
		params.require(:bulk_message).permit(:body,:message_type,:subject,:email_body,:student_id,:batch_id)
	end
end
