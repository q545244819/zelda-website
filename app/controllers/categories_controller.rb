class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = Article.limit(12).order(created_at: :desc).where({ category_id: @category.id })
  end
end
