# Preview all emails at http://localhost:3000/rails/mailers/notifications_mailer
class NotificationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/signup
  def signup
    user = Zuser.last
    NotificationsMailer.signup(user)
  end

  def new_article
    user = Zuser.last
    NotificationsMailer.new_article(user)
  end
end
