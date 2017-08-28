class BulkMessageEmployeesController < ApplicationController

  def new
    @bulk_message_employee = BulkMessageEmployee.new
  end

  def index
    @bulk_message_employees = BulkMessageEmployee.all
  end

  def allemp
    @department = EmployeeDepartment.shod(params[:id])
    @employees ||= @department.employees.all
  end

  def create
   ids = []
     employee_department_id = EmployeeDepartment.find_by(id: params[:bulk_message_employee][:employee_department_id])
     employee_department_id.present? && params[:employee_ids].present? && params[:employee_ids].each do |employee_id|
       if Employee.find(employee_id.to_i)
         ids << employee_id
         bulk_message = BulkMessageEmployee.find_or_initialize_by(employee_id: employee_id.to_i, employee_department_id: params[:bulk_message_employee][:employee_department_id])
         bulk_message.body = params[:bulk_message_employee][:body]
         bulk_message.save
         flash[:notice] = t('message_to_employee_sent')
       end
     end
     @employees = Employee.where(id: ids)
      redirect_to '/bulk_messages/sms'
  end

private

def bulk_message_employee_params
    params.require(:bulk_message_employee).permit!
  end
end
