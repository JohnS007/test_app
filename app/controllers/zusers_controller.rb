class ZusersController < ApplicationController

  def new
    @zuser = Zuser.new
  end

  def create
    @zuser = Zuser.new(zuser_params)
    if @zuser.save
      flash[:success] = "Welcome to the Blog, #{@zuser.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @zuser = Zuser.find(params[:id])
  end

  def update
    @zuser = Zuser.find(params[:id])
    if @zuser.update(zuser_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private
  def zuser_params
    params.require(:zuser).permit(:username, :email, :password)
  end
end
