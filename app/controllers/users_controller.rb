class UsersController < ApplicationController
  def new
  
  end

  def create
    user = User.new(user_params)
    puts user.inspect
    if user.save
      # session[:user_id] = user.user_id
      redirect_to '/'
    else 
      redirect_to '/signup' 
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :password_confirm)
  end
end
