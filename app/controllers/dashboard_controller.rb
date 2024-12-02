class DashboardController < ApplicationController
  def index
    @articles = Article.all
    if @articles.nil? || @articles.empty?
      # Handle the case where there are no articles
      flash[:notice] = "No articles found."
    end
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(params.permit(:name, :category, :content, :draft))
    if article.save
      redirect_to '/dashboard', notice: "Article created."
    else
      redirect_to new_article_path, alert: "Article could not be created."
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.update(params.permit(:name, :category, :content, :draft))
      redirect_to '/dashboard', notice: "Article updated."
    else
      redirect_to edit_article_path(article), alert: "Article could not be updated."
    end
  end

  def delete
    article = Article.find(params[:id])
    if article.destroy
      redirect_to '/dashboard', notice: "Article deleted."
    else
      redirect_to article_path(article), alert: "Article could not be deleted."
    end
  end
end
