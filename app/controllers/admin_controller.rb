class AdminController < ApplicationController
  layout 'admin', except: [:index]

  def index
    session[:user] = nil
    @user = User.take
    @path = @user > 0 ? '/login' : '/register'
  end

  def articles
    @name = 'articles'
    @articles = Article.order(created_at: :desc)
      .select('id', 'title', 'image', 'category_id', 'created_at', 'updated_at')
      .limit(20)
      .paginate(page: params[:page || 1])
  end

  def article_edit
    @name = 'article_edit'
    @categories = Category.all
    @article = Article.find(params[:id])
  end

  def article_update
    article = Article.find(params[:id])

    article.title = article_params[:title]
    article.image = article_params[:image]
    article.category_id = article_params[:category_id]
    article.body = article_params[:body]

    @new = article.save

    if @new
      flash[:success] = '更新文章成功！'
      redirect_to "/admin/articles/#{params[:id]}"
    else
      flash[:error] = '更新文章失败！'
      redirect_to "/admin/articles/#{params[:id]}"
    end
  end

  def categories
    @name = 'categories'
    @categories = Category.order(created_at: :desc)
      .limit(20)
      .paginate(page: params[:page || 1])
  end

  private
    def article_params
      params.permit(:title, :image, :category_id, :body)
    end
end
