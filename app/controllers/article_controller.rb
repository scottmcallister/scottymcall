class ArticleController < ApplicationController
  def index
    @articles = Article.all
    if @articles.nil? || @articles.empty?
      # Handle the case where there are no articles
      flash[:notice] = "No articles found."
    end
  end

  def show
    @article = Article.find(params[:id])
    puts @article.inspect
  end
end
