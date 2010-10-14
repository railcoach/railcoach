class UserSessionsController < ApplicationController
  # POST /user_sessions
  def create
    @user_session = UserSession.new(params[:user_session])

    @user_session.save do |result|
      if result
        redirect_to(root_url, :notice => 'Successfully logged in!')
      else
        render :action => "create"
      end
    end
  end

  # DELETE /user_sessions/1
  def destroy
    @user_session = UserSession.find    
    @user_session.destroy
    redirect_to(root_url, :notice => 'Successfully logged out!')
  end
end
