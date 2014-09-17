# app/controllers/blog/articles_controller.rb
class Blog::ArticlesController < ApplicationController
  def index
    @all_articles = Blog::Article.all.sort { |a,b| b.created_at <=> a.created_at }
    
    @all_tags = Blog::Article.distinct_tags
    
    if params[:tags]
      puts 'tagsssssssssss'
      @articles = @all_articles.select{ |article| article.tags.include? params[:tags]}
      
      if !@articles.any?
        @articles = @all_articles
      end
    else
      @articles = @all_articles
    end
    
  end

  def show
    @article = Blog::Article.find_by_name(params[:id])
  end
end