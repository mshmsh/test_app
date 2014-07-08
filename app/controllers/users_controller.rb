class UsersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create, :show, :edit]  
  before_action :signed_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user , only: [:index, :destroy]
  
  def index 
    @users = User.all
  end 

  def new
  	@user = User.new
  end

  def show

  end
  # POST /carts
  # POST /carts.json
def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Spirit Application!"
      redirect_to @user
    else
      render 'new'
    end
  end

  
  def edit 
  end 
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
   
   private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id,:name,:email,:password,:password_confirmation)
    end
   
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
end
