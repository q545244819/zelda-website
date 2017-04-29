class HomeController < ApplicationController
  def index
    @categories = Category.all
    @articles = {}
    @count = 6

    @articles['hot'] = Article.limit(@count).order(created_at: :desc)
    
    @categories.each do |item|
      @articles[item.id] = Article.limit(@count).order(created_at: :desc).where({ category_id: item.id })
    end
  end
end
