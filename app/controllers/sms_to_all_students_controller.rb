class SmsToAllStudentsController < ApplicationController

	def new
		@sms_to_all_student = SmsToAllStudent.new
		@students = Student.all
	end

	 def create
    ids = []
    params[:student_ids].present? && params[:student_ids].each do |student_id|
      if Student.find(student_id.to_i)
        ids << student_id
        message = SmsToAllStudent.find_or_initialize_by(student_id: student_id.to_i)
        message.body = params[:sms_to_all_student][:body]
        message.save
      end
    end
    flash[:notice] = t('message_to_student_sent')
    @students = Student.where(id: ids)
    redirect_to '/bulk_messages/sms'
  end


  def index
   @sms_to_all_students = SmsToAllStudent.all
  end

	private

	def params_bulk_message
		params.require(:sms_to_all_student).permit!
	end
end
