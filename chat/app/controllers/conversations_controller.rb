class ConversationsController < ApplicationController
  
  def create
    @conversation = Conversation.get(current_user.id, params[:user_id])
    
    add_to_conversations unless conversated?

    respond_to do |format|
      format.js
    end
  end

  def close
    @conversation = Conversation.find(params[:id])

    session[:conversations].delete(@conversation.id)

    respond_to do |format|
      format.js
    end
  end

  def destroy
      @conversation = Conversation.find(params[:id])
      @conversation.destroy
      redirect_to root_path
  end
  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end

  def conversated?
    session[:conversations].include?(@conversation.id)
  end
  

  


end