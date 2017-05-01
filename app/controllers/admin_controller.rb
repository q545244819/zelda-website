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
      .select('id', 'title', 'image', 'category_id')
      .limit(20)
      .paginate(page: params[:page || 1])
  end
end
