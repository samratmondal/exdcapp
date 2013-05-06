class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def index
  	@users = User.all
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      flash[:success] = "New user added"
      # Added meaningless get parameter to deal with bug in Chrome
  	  redirect_to users_path(chrome_bug_workaround: 177855)
  	else
  	  render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User updated"
      redirect_to user_path(chrome_bug_workaround: 177855)
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted." 
    redirect_to users_url
  end

  def edit
    @user = User.find(params[:id])
  end

end
