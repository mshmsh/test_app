class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :get_categories
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
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
end
