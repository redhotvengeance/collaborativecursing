class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    user = User.find_by_name(params[:name])

    if user and user.authenticate(params[:password])
      if user.is_verified
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to login_url, alert: "Hmmm, looks like this account isn't verified yet."
      end
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
