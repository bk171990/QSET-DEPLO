class MessageToAllDepartmentsController < ApplicationController
	def new
		@message_to_all_department = MessageToAllBatch.new
		@employee_departments = EmployeeDepartment.all
	end

	def create
    ids = []
    params[:employee_department_ids].present? && params[:employee_department_ids].each do |employee_department_id|
      if EmployeeDepartment.find(employee_department_id.to_i)
        ids << employee_department_id
        message = MessageToAllDepartment.find_or_initialize_by(employee_department_id: employee_department_id.to_i)
        message.body = params[:message_to_all_department][:body]
        message.save
      end
    end
    flash[:notice] = t('message_to_department_sent')
    @message_to_all_departments = EmployeeDepartment.where(id: ids)
    redirect_to '/bulk_messages/sms'
  end


  def index
   @message_to_all_departments = MessageToAllDepartment.all
  end

	private

	def params_bulk_message
		params.require(:message_to_all_department).permit!
	end
end
