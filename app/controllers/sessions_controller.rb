class SessionsController < ApplicationController
  before_action :not_logged_in_user, only: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end


  private
    def not_logged_in_user
      if logged_in?
        redirect_to current_user
      end
    end
end
