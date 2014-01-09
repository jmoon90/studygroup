class Message < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :subject
  validates_presence_of :description
  validates_presence_of :first_name
  validates_presence_of :last_name

  def self.sender(message)
    message.email
  end
end
