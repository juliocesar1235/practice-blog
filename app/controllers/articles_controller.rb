class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_parameters)

    if @article.save
    redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_parameters)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    def article_parameters
      params.require(:article).permit(:title, :text)
    end
end
