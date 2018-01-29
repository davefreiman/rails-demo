class WelcomeController < ApplicationController
  def index
    @word = params[:word] || 'Somebody'
    @blogs = Blog.all
  end
end
