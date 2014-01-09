class MessageConfirmation < ActionMailer::Base
  default to: 'johnmoonyy@gmail.com'

  def content(message)
    @message = message
    mail from: message.email,
        subject: message.subject
  end
end
