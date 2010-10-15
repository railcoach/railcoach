class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end
  
  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_url
    else
      render :action => :new
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end
end