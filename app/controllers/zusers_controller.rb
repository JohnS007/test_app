class ZusersController < ApplicationController

  before_action :set_zuser, only: [:edit, :update, :show]
  before_action :require_same_zuser, only: [:edit, :update]

  def index
    @zusers = Zuser.all
  end

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
  end

  def update
    if @zuser.update(zuser_params)
      flash[:success] = "Your account was successfully updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @zuser_articles = @zuser.articles.paginate(page: params[:page], per_page: 3)
  end

  private

  def zuser_params
    params.require(:zuser).permit(:username, :email, :password)
  end

  def set_zuser
    @zuser = Zuser.find(params[:id])
  end

  def require_same_zuser
    if current_zuser != @zuser
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end
