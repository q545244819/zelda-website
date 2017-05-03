class CategoriesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def show
    @category = Category.find(params[:id])
    @articles = Article.order(created_at: :desc).where({ category_id: @category.id }).paginate(page: params[:page || 1])
  end

  def update
    category = Category.find(params[:id])

    category.name = category_params[:name]
    category.image = category_params[:image]
    category.description = category_params[:description]

    @new = category.save

    if @new
      flash[:success] = '更新类别成功！'
      redirect_to "/admin/categories/#{params[:id]}"
    else
      flash[:error] = '更新文类别失败！'
      redirect_to "/admin/categories/#{params[:id]}"
    end
  end

  private
    def category_params
      params.permit(:name, :image, :description)
    end
end
