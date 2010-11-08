class ActivationsController < ApplicationController
  #Code cp'ed from github.com/matthooks/authlogic-activation-tutorial
  before_filter :require_no_user

  def create
    @user = User.find_using_perishable_token(params[:activation_code], 1.week || (raise Exception))
    raise Exception if @user.active?

    if @user.activate!
      flash[:notice] = "Your account has been activated!"
      UserSession.create(@user, false)
      @user.deliver_welcome!
      redirect_to account_url
    else
      render :action => :new
    end
  end

end
