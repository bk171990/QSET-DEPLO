class UserMailer < ActionMailer::Base
  default from: '"School"<demo.qset@gmail.com>'

  def student_email(user, subject, message)
     @user = user
     user = "#{@user.email}"
    @message = message
    mail(to: @user.email, subject: "#{subject}")
  end
end
