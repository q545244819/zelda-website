class UsersController < ApplicationController
  require 'digest/md5'
  skip_before_filter :verify_authenticity_token

  def register
    user = User.find_by(user_body)
    categories = Category.all

    if user == nil
      user = User.create(user_body)
    end

    if categories.length == 0
      Category.create([
        {
          name: '无人机',
          description: 'uav'
        },
        {
          name: '机器学习',
          description: 'machine learning'
        },
        {
          name: '人工智能',
          description: 'artificial intelligence'
        }
      ])
    end

    session[:user] = user
    redirect_to '/admin/articles'
  end

  def login
    user = User.find_by(user_body)

    if user
      session[:user] = user
      redirect_to '/admin/articles'
    else
      flash[:error] = "用户名或密码错误！"
      redirect_to '/admin'
    end
  end

  def logout
    session[:user] = nil
    flash[:success] = "登出成功！"
    redirect_to '/admin'    
  end

  private
    def user_params
      params.permit(:username, :password, :name)
    end
    def user_body
      {
        username: user_params[:username],
        password: Digest::MD5.hexdigest(user_params[:password]),
        name: user_params[:name]
      }
    end
end
