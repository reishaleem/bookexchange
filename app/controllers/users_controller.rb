class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def create
    @user = User.new(user_params)

      if @user.save
        log_in @user
        flash[:success] = 'Welcome to the Book Exchange!'
        redirect_to @user
      else
        render 'new'
      end
  end


  private
  
    def user_params
      params.require(:user).permit(:name, :email, :phone, :rank, :age, :password, :password_confirmation)
    end
end
