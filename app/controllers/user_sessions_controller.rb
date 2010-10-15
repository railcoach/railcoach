class UserSessionsController < ApplicationController
<<<<<<< HEAD

  def new
    @user_session = UserSession.new
  end
  
=======
>>>>>>> 15543acf7abfad3ed9f541e3f360c3ba53465bc7
  # POST /user_sessions
  def create
    @user_session = UserSession.new(params[:user_session])
<<<<<<< HEAD
    if @user_session.save
      redirect_to root_url
    else
      render :action => :new
=======

    @user_session.save do |result|
      if result
        redirect_to(root_url, :notice => 'Successfully logged in!')
      else
        render :action => "create"
      end
>>>>>>> 15543acf7abfad3ed9f541e3f360c3ba53465bc7
    end
  end

  # DELETE /user_sessions/1
<<<<<<< HEAD
  # DELETE /user_sessions/1.xml
  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
=======
  def destroy
    @user_session = UserSession.find    
    @user_session.destroy
    redirect_to(root_url, :notice => 'Successfully logged out!')
>>>>>>> 15543acf7abfad3ed9f541e3f360c3ba53465bc7
  end
end