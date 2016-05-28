class UserMailer < ActionMailer::Base
  default :from => "ian.m.y.wong@gmail.com"

  def register_account(user)
    @user = user
    email_target = %("#{@user.username}" <#{@user.email}>)
    mail(to: email_target, subject: "TeamUp - Confirm Your Account")
  end
end
