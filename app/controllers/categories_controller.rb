class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @articles = Article.order(created_at: :desc).where({ category_id: @category.id }).paginate(page: params[:page || 1])
  end
end
