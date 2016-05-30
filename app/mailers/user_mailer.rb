class UserMailer < ActionMailer::Base
  default :from => "teamup.confirmation@gmail.com"

  def register_account(user)
    @user = user
    email_target = %("#{@user.username}" <#{@user.email}>)
    mail(to: email_target, subject: "TeamUp - Confirm Your Account")
  end
end
