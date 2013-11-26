class SessionsController < ApplicationController
  skip_before_action :login_required, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(:email =>params[:email])
    if user && user.authenticate(params[:password])
      login(user.id)
      flash[:"alert-success"] = "Succesfull login"
      redirect_to "/users/dashboard"
    else
      flash[:"alert-danger"] = "Invalid login"
      redirect_to '/'
    end
  end

  def destroy
    reset_session
    flash[:"alert-info"] = "Thank you, you are now logged out"
    redirect_to root_path 
  end

end
