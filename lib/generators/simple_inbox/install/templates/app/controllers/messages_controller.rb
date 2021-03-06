class MessagesController < ApplicationController
  before_filter :find_message_copy, :only => [:show]

  def index
    @messages = case params[:message_type]
      when 'sent' then
        MessageCopy.sent(current_user)
      when 'trash' then
        MessageCopy.trash(current_user)
      else
        MessageCopy.inbox(current_user)
                end
    @unread_messages_count = @messages.unread.count
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.sender = current_user
    prepare_message_recipients
    if @message.save
      redirect_to messages_path, :notice => 'Message was successfully created.'
    else
      render :action =>:new
    end
  end

  def show
    @message.mark_as_read(current_user)
  end

  def mark_as
    method = case params[:message_status]
               when 'read' then 'mark_as_read'
               when 'unread' then 'mark_as_unread'
               when 'deleted' then 'mark_as_deleted'
             end
    mark_messages(params[:messages_ids], method)
    redirect_to messages_path(:message_type => params[:message_type]), :notice => "Message was marked as #{params[:message_status]}."
  end

  private
  def find_message_copy
    redirect_to '/404' if (@message = MessageCopy.find_by_id(params[:id])).nil?
  end

  #extract recipients from params
  def prepare_message_recipients
    #TODO stub change it to your's autocomplete or smth else
    @message.to = params[:to]
  end

  #find message copies and send to them method
  def mark_messages(messages_ids, method)
    messages_ids.each do |m_id|
      if (message_copy = MessageCopy.find_by_id(m_id)).present?
        message_copy.send(method, current_user)
      end
    end
  end
end