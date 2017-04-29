class HomeController < ApplicationController
  def index
    @categories = Category.all
    @articles = {}
  end
end
