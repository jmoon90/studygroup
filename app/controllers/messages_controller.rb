class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      MessageConfirmation.content(@message).deliver
      flash[:notice] = 'Your message has been sent.'
      redirect_to root_path
    else
      flash[:notice] = 'Invalid information. Please try again.'
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:email,
                                    :first_name,
                                    :last_name,
                                    :description,
                                    :subject)
  end
end
