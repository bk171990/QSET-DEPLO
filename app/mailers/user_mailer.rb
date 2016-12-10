class UserMailer < ActionMailer::Base
  default from: '"School"<dhanshree.j.kamble@gmail.com>'

  def student_email(user, subject, message)
     @user = user
     user = "#{@user.email}"
    @message = message
    mail(to: @user.email, subject: "#{subject}")
  end
end
