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

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@user) }
      end
    end
  end


  private
  
    def user_params
      params.require(:user).permit(:name, :email, :phone, :rank, :age, :password, :password_confirmation, :avatar)
    end
end
