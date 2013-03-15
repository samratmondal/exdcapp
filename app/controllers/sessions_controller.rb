class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_cmmi_user_name(params[:session][:user_name].downcase)
  	if user && user.authenticate(params[:session][:password])
      if user.admin_flag == "Y"
        redirect_to home_path
      else
        flash[:error] = 'You are not an authorized Admin user'
        render 'new'
      end
  	else
  	  flash[:error] = 'Invalid user_name/password combination'
      render 'new'
    end
  end

  def destroy
  end

end
