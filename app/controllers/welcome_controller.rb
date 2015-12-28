class WelcomeController < ApplicationController
  def index
    User.all.each do |user|
      CommentMailer.comment_notify_email(user).deliver
    end
  end
end
