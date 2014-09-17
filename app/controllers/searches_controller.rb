class SearchesController < ApplicationController
    before_action :set_search, only: [:show]


    def new
        #@search = Search.new
        @products = Product.all
    end

    def create
        @search = Search.new(search_params)
        respond_to do |format|
      if @search.save
        format.html { redirect_to @search}
        format.json { render :show, status: :created, location: @search }
      else
        format.html { render :new }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end

    end

    def show

    end



    private
        def search_params
            params.require(:search).permit(:keywords, :min_price, :max_price)
        end

        def set_search
            @search = Search.find(params[:id])
        end



end
