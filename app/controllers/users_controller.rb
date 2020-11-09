class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    @books = Book.where(:status_type => 'Share',user_id: params[:user_id]).all
  end
end
