class UserMailer < ApplicationMailer

    def welcome_email(email, subject, message)
        @email = email
        @message = message
        email_with_name = %("#{"Recipient name here"}" <#{email}>)
        attachments.inline['attachment.jpg'] = File.read('/home/beryl/Desktop/Training/Training/Rails/college/app/assets/images/mail/sample_attachment.jpg')
        mail(to: email_with_name, subject: subject ,template_path: 'user_mailer', template_name: 'signup')
    end

    def login_alert_email(email, subject, message)
        @email = email
        @message = message
        email_with_name = %("#{"Recipient name here"}" <#{email}>)
        attachments.inline['attachment.jpg'] = File.read('/home/beryl/Desktop/Training/Training/Rails/college/app/assets/images/mail/sample_attachment.jpg')
        mail(to: email_with_name, subject: subject, template_path: 'user_mailer', template_name: 'login')
    end

    def logout_alert_email(email, subject, message)
        @message = message
        email_with_name = %("#{"Recipient name here"}" <#{email}>)
        attachments.inline['attachment.jpg'] = File.read('/home/beryl/Desktop/Training/Training/Rails/college/app/assets/images/mail/sample_attachment.jpg')
        mail(to: email_with_name, subject: subject, template_path: 'user_mailer', template_name: 'logout')
    end

    def update_alert_email(email, subject, message)
        @message = message
        email_with_name = %("#{"Recipient name here"}" <#{email}>)
        attachments.inline['attachment.jpg'] = File.read('/home/beryl/Desktop/Training/Training/Rails/college/app/assets/images/mail/sample_attachment.jpg')
        mail(to: email_with_name, subject: subject, template_path: 'user_mailer', template_name: 'update')
    end

    def user_delete_email(email, subject, message)
        @message = message
        email_with_name = %("#{"Recipient name here"}" <#{email}>)
        attachments.inline['attachment.jpg'] = File.read('/home/beryl/Desktop/Training/Training/Rails/college/app/assets/images/mail/sample_attachment.jpg')
        mail(to: email_with_name, subject: subject, template_path: 'user_mailer', template_name: 'destroy')
    end

    def password_update_email
        @message = message
        email_with_name = %("#{"Recipient name here"}" <#{email}>)
        attachments.inline['attachment.jpg'] = File.read('/home/beryl/Desktop/Training/Training/Rails/college/app/assets/images/mail/sample_attachment.jpg')
        mail(to: email_with_name, subject: subject, template_path: 'user_mailer', template_name: 'update_password')
    end
    
end
