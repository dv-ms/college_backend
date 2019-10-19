class EmailWorker
  include Sidekiq::Worker

  def perform(type, email, subject, message)
    # Do something
    case type
    when 1
      UserMailer.welcome_email(email, subject, message).deliver_now
    when 2
      UserMailer.login_alert_email(email, subject, message).deliver_now
    when 3
      UserMailer.logout_alert_email(email, subject, message).deliver_now
    when 4
      UserMailer.update_alert_email(email, subject, message).deliver_now
    when 5
      UserMailer.user_delete_email(email, subject, message).deliver_now
    when 6
      UserMailer.password_update_email(email, subject, message).deliver_now
    end
  end
end