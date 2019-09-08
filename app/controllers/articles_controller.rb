class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params) # white list the article parameters through article_params function.
    if @article.save                          # saving the article after white-listing the parameters.
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)    # redirect to articles show action and pass the article to the
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted."
    redirect_to articles_path
  end
  private
    def article_params
      params.require(:article).permit(:title, :description) # grab the params hash passed by the new action, require the top level
                                                            # key (:article) and apply permit() method to title, description.
    end

end
