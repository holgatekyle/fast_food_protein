# app/controllers/blog/articles_controller.rb
class Blog::ArticlesController < ApplicationController
  def index
    @articles = Blog::Article.all
    puts @articles
  end

  def show
    @article = Blog::Article.find_by_name(params[:id])
  end
end