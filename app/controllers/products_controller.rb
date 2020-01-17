class ProductsController < ApplicationController

    # Code for listing all products
    def index
        @products = Product.all
        render :index
    end
    
    # Code for new product form
    def new
        @product = Product.new
        render :new
    end
    
    # Code for creating a new product
    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end
    
    # Code for edit product form
    def edit
        @product = Product.find(params[:id])
        render :edit
    end
    
    # Code for showing a single product
    def show
        @product = Product.find(params[:id])
        render :show
    end
    
    # Code for updating an product
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to products_path
        else
            render :edit
        end
    end
    
    # Code for deleting an product
    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to products_path
    end

    private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
    
end