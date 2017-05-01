class UsersController < ApplicationController
  require 'digest/md5'

  def register
    user = User.find_by(user_body)

    if user == nil
      @user = User.create(user_body)
    end
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