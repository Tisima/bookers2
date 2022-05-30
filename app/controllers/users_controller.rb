class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_authenticated_user, only: [:edit, :update]

  def show
  @user = User.find(params[:id])
  @book = @user.books
  @book_new = Book.new
  end


  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice]="You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    render :edit
  end
  end
  def edit
    @user = User.find(params[:id])
  end
  def index
  @user = current_user
  @book = @user.books
  @book_new = Book.new
  @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def is_authenticated_user
    # @book = Book.find(params[:id])
    @user = User.find(params[:id])
    redirect_to(books_path) unless @user == current_user
  end
end