class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_cmmi_user_name(params[:session][:user_name].downcase)
  	if user && user.authenticate(params[:session][:password])
      # sign_in user
      redirect_to home_path
  	else
  	  flash[:error] = 'Invalid user_name/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end

end
