class ArticlesController < ApplicationController

  def new
    @article = Article.new
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

  def show
    @article = Article.find(params[:id])
  end
  private
    def article_params
      params.require(:article).permit(:title, :description) # grab the params hash passed by the new action, require the top level
                                                            # key (:article) and apply permit() method to title, description.
    end

end
