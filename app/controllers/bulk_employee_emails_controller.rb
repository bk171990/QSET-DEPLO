class BulkEmployeeEmailsController < ApplicationController

  def new
  	@bulk_employee_email = BulkEmployeeEmail.new
  end

  def index
    @bulk_employee_emails = BulkEmployeeEmail.all  	
  end

  def create
  	ids = []
     employee_department_id = EmployeeDepartment.find_by(id: params[:bulk_employee_email][:employee_department_id])
     employee_department_id.present? && params[:employee_ids].present? && params[:employee_ids].each do |employee_id|
       if Employee.find(employee_id.to_i)
         ids << employee_id
       @bulk_employee_email =BulkEmployeeEmail.find_or_initialize_by(employee_id: employee_id.to_i, employee_department_id: params[:bulk_employee_email][:employee_department_id],body: params[:bulk_employee_email][:body],subject: params[:bulk_employee_email][:subject]) 
        UserMailer.send_email_to_employees(@bulk_employee_email).deliver_now
        @bulk_employee_email.save  
      end
     end
     @employees = Employee.where(id: ids)
    redirect_to bulk_employee_emails_path
  end
   
   def selected_department
  	@department = EmployeeDepartment.shod(params[:id])
    @employees ||= @department.employees.all
   end

  private
    
    def bulk_email_params
		params.require(:bulk_employee_email).permit!
	end
end