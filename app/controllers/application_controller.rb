class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :get_categories
  before_action :set_cache_buster
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

    private

    def get_categories
      @categories = Category.all.sorted
    end
    def increment_counter
      if session[:counter].nil?
        session[:counter] = 0
      else
        session[:counter] += 1
      end
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url
        flash[:warning] = "Please sign in."
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

   end
