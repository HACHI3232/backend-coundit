class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_article, only: [:show, :update, :destroy]

  def index
    articles = Article.all
    render json: articles, status: :ok
  end

  def create
    article = current_user.articles.build(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def show
    if @article
      render json: @article
    else
      render json: { error: 'Article not found' }, status: :not_found
    end
  end

  def update
    if @article.update(article_params)
      render json: { message: 'Article updated successfully', article: @article }
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @article&.destroy
      render json: { message: 'Article deleted successfully' }
    else
      render json: { error: 'Article not found or not owned by user' }, status: :not_found
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end

  def set_article
    @article = Article.find_by(slug: params[:slug])
  end
end
