class ArticlesController < ApplicationController

  before_action :authenticate!, except: [ :show, :index ]

  def new
    @article = Article.new
  end
  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update edit_article_params @article.author
      redirect_to @article
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new new_article_params
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find params[:id]
  end

  def index
    @articles = Article.all
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

  private

  def article_form_params
    params.require(:article).permit(:title, :text, :attachment)
  end

  def edit_article_params(author)
    article_form_params.tap { |p| p[:author] = author }
  end

  def new_article_params
    article_form_params.tap { |params| params[:author] = current_user }
  end
end
