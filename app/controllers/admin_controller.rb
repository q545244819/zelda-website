class AdminController < ApplicationController
  layout 'admin'
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user!, except: [:index]

  def authenticate_user!
    if !session[:user]
      redirect_to '/admin'
    end
  end

  def index
    session[:user] = nil
    @user = User.take
    @path = @user ? '/login' : '/register'
  end

  def articles
    @name = 'articles'
    @articles = Article.order(created_at: :desc)
      .select('id', 'title', 'image', 'category_id', 'created_at', 'updated_at')
      .paginate(page: params[:page || 1])
  end

  def article_new
    @name = 'article_new'
    @path = '/admin/articles/new'
    @categories = Category.all
    @article = ''
    
    render 'article'
  end

  def article_create
    @article = Article.new(article_params)
    @article.save

    if @article
      flash[:success] = '添加文章成功！'
      redirect_to '/admin/articles'
    else
      flash[:error] = '添加文章失败！'
      redirect_to '/admin/articles'
    end
  end

  def article_edit
    @name = 'article_edit'
    @path = "/admin/articles/#{params[:id]}"
    @categories = Category.all
    @article = Article.find(params[:id])

    render 'article'
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

  def article_destroy
    @article = Article.find(params[:id])
    @article.destroy

    if @article
      flash[:success] = '删除文章成功！'
      redirect_to '/admin/articles'
    else
      flash[:error] = '删除文章失败！'
      redirect_to '/admin/articles'
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
