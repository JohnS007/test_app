class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :destroy, :show]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)  #paginating the articles, 5 articles, per_page
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params) # white list the article parameters through article_params function.
    @article.zuser = Zuser.first
    if @article.save                          # saving the article after white-listing the parameters.
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)    # redirect to articles show action and pass the article to the show method
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to articles_path
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description) # grab the params hash passed by the new action, require the top level
                                                            # key (:article) and apply permit() method to title, description.
    end

end
