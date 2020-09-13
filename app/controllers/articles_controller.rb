class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
  end
  def create
    # render plain: params[:article].inspect

    #Article refer to Article class in  /app/model
    
    # @article = Article.new(params[:article].permit(:title,:text))
    
    # recommend way ,  because it can be reuse many time
    @article = Article.new(article_params)
    @article.save   
    redirect_to @article
  end
  def show
    @article = Article.find(params[:id])
  end
  


  private
  def article_params
    params.require(:article).permit(:title, :text)


  end

end
