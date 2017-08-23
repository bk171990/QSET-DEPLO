class UserMailer < ActionMailer::Base
  default from: '"School"<demo.qset@gmail.com>'

  def student_email(user, subject, message)
    @user = user
    user = "#{@user.email}"
    @message = message
    mail(to: @user.email, subject: "#{subject}")
  end

  def send_email_students(email_body)
  	@bulk_email = email_body
  	mail(to: @bulk_email.student.email, email_body: "#{email_body}")
  end

  def send_email_to_employees(body)
    @bulk_employee_email = body
    mail(
    :to => @bulk_employee_email.employee.email,
    ) do |format|
    format.text { render :send_email_to_employees => body }
    end
  end

end