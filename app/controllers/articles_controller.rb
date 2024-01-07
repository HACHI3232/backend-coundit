class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def create
    article = current_user.articles.build(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def show
    article = Article.find_by(slug: params[:slug])
    if article
      render json:article
    else
      render json: {error: 'Article not found'},status:not_found
    end
  end

  def update
    article = Article.find_by(slug: params[:slug])
    if article.update(article_params)
      render json :article
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find_by(slug: params[:slug])
    if article&.destroy
      head :no_content
    else
      render json: { error: 'Article not found or not owned by user' }, status: :not_found
    end
  end
  private

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end
end
