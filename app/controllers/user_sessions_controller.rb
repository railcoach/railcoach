class UserSessionsController < ApplicationController

  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])

    respond_to do |format|
      @user_session.save do |result|
        if result
          format.html { redirect_to(root_url, :notice => 'Successfully logged in!') }
          format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
        else
          format.html { render :action => "create" }
          format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

 # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find    
    @user_session.destroy


    respond_to do |format|
      format.html { redirect_to(root_url, :notice => 'Successfully logged out!') }
      format.xml  { head :ok }
    end
  end
end
