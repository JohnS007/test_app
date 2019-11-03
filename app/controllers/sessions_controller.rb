class SessionsController < ApplicationController

  def new

  end

  def create
    zuser = Zuser.find_by(email: params[:sessions][:email].downcase)
    if zuser && zuser.authenticate(params[:sessions][:password])
      if zuser.email_confirmed
        session[:user_id] = zuser.id
        flash[:success] = "You are successfully logged in."
        redirect_to zuser_path(zuser)
      else
         flash[:danger] = "Please activate your account by following the
        instructions in the account confirmation email you received to proceed"
        render 'new'
      end
    else
      flash.now[:danger] = "There was something wrong with your credentials."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end

end
