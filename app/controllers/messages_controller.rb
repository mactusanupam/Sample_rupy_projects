class MessagesController < ApplicationController
  before_action :set_message, only: [ :destroy]

  # GET /messages
  def index
    @messages = Message.all
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    @message.save
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: 'Message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:name, :email, :mobile, :body, :type, :subject, :terms_and_condition)
    end
end
