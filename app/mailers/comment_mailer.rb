class CommentMailer < ApplicationMailer
  def comment_notify_email(user)
    @user = user
    mail to: @user.email, subject: 'HTML 课程登录指南'
  end
end
