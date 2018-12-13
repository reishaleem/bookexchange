class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :not_logged_in_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.paginate(page: params[:page], per_page: 6)
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

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def not_logged_in_user
      if logged_in?
        redirect_to current_user
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
