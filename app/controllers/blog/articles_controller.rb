# app/controllers/blog/articles_controller.rb
class Blog::ArticlesController < ApplicationController
  def index
    @articles = Blog::Article.all.sort { |a,b| b.created_at <=> a.created_at }
  end

  def show
    @article = Blog::Article.find_by_name(params[:id])
  end
end