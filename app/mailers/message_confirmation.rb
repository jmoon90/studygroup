class MessageConfirmation < ActionMailer::Base
  default from: "from@example.com"

  def content(message)
    @message = message
    mail to: "admin@example.com",
         subject: message.subject,
         description: message.description
  end
end
