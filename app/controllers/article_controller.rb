class ArticleController < ApplicationController
  allow_unauthenticated_access

  def index
    @articles = Article.where(draft: false).order(created_at: :desc)
    if @articles.nil? || @articles.empty?
      # Handle the case where there are no articles
      flash[:notice] = "No articles found."
    end
  end

  def show
    @article = Article.find(params[:id])
    if @article.draft
      raise ActiveRecord::RecordNotFound
    end
  end
end
