class MessageConfirmation < ActionMailer::Base
 default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message.content.subject
  #
  def content(message)
    @message = message
    mail to: "admin@example.com",
      subject: "#{message.subject}",
      description: "#{message.description}"
  end
end
