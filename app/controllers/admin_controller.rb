class AdminController < ApplicationController
  layout 'admin', except: [:index]

  def index
    session[:user] = nil
    @user = User.all
    @path = @user.length > 0 ? '/login' : '/register'
  end
end
