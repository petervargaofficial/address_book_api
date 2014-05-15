class SiteMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']

  def status_email(email, subject, body)
  	@body = body
    mail(to: email, subject: subject)
  end
end
