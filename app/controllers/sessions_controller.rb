class SessionsController < ApplicationController
	include CurrentCart
	before_action :set_cart, only: [:new, :create]
	def new
	end

  def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
        user.set_previous_login_time
        user.update_login_time
        redirect_back_or user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
