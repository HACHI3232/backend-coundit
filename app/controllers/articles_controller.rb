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

  private

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end
end
