class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params) # white list the article parameters through article_params function.
    @article.save                          # saving the article after white-listing the parameters.
    redirect_to articles_show(@article)    # redirect to articles show action and pass the article to the
  end

  private
    def article_params
      params.require(:article).permit(:title, :description) # grab the params hash passed by the new action, require the top level
                                                            # key (:article) and apply permit() method to title, description.
    end

end
