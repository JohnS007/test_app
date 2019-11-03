class ZusersController < ApplicationController

  before_action :set_zuser, only: [:edit, :update, :show]
  before_action :require_same_zuser, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @zusers = Zuser.all
  end

  def new
    @zuser = Zuser.new
  end

  def create
    @zuser = Zuser.new(zuser_params)
    if @zuser.save
      # session[:user_id] = @zuser.id
      flash[:success] = "Hello, #{@zuser.username} please confirm your email address to continue"
      UserMailer.registration_confirmation(@zuser).deliver
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @zuser.update(zuser_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @zuser = Zuser.find(params[:id])
    @zuser.destroy
    flash[:danger] = "The user and all the articles created by user have been deleted."
    redirect_to zusers_path
  end
  def show
    @zuser_articles = @zuser.articles.paginate(page: params[:page], per_page: 3)
  end

  def confirm_email
    user = Zuser.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Test App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to login_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to root_path
    end
  end

  private

  def zuser_params
    params.require(:zuser).permit(:username, :email, :password)
  end

  def set_zuser
    @zuser = Zuser.find(params[:id])
  end

  def require_same_zuser
    if current_zuser != @zuser and !current_zuser.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_zuser.admin?
      flash[:danger] = "Only admin user can perform that action"
      redirect_to root_path
    end
  end
end
