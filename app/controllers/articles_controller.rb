class ArticlesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def show
    @article = Article.find(params[:id])
  end

  def create
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

  def update
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

  private
    def article_params
      params.permit(:title, :image, :category_id, :body)
    end
end
