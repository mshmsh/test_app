class SearchesController < ApplicationController
      include CurrentCart
     before_action :set_search, only: [:show]
     before_action :set_cart


    def new
        #@search = Search.new
        #@products = Product.all.paginate(:page => params[:page], :per_page => 12)
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
       @products =  @search.products.paginate(page: params[:page], :per_page => 9)
    end



    private
        def search_params
            params.require(:search).permit(:keywords, :min_price, :max_price)
        end

        def set_search
            @search = Search.find(params[:id])
        end



end
