class SmsToAllEmployeesController < ApplicationController
	def new
		@sms_to_all_employee = SmsToAllEmployee.new
		@employees = Employee.all
	end

	 def create
    ids = []
    params[:employee_ids].present? && params[:employee_ids].each do |employee_id|
      if Employee.find(employee_id.to_i)
        ids << employee_id
        message = SmsToAllEmployee.find_or_initialize_by(employee_id: employee_id.to_i)
        message.body = params[:sms_to_all_employee][:body]
        message.save
      end
    end
    flash[:notice] = t('message_to_employee_sent')
    @employees = Employee.where(id: ids)
    redirect_to '/bulk_messages/sms'
  end


  def index
   @sms_to_all_employees = SmsToAllEmployee.all
  end

	private

	def params_bulk_message
		params.require(:sms_to_all_employee).permit!
	end
end
