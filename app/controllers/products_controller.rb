class ProductsController < ApplicationController

    def home_page
        @most_reviewed_product = Product.product_with_most_reviews
        @made_in_usa = Product.made_in_usa
        @recently_added = Product.recently_added
        render :home_page
    end

    # Code for listing all products
    def index
        @products = Product.all
        if params[:product_with_most_reviews]
            @products = Product.product_with_most_reviews
        elsif params[:made_in_usa]
            @products = Product.made_in_usa
        elsif params[:recently_added]
            @products = Product.recently_added
        end
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
            flash[:notice] = "#{@product.name} was successfully added!"
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
            flash[:notice] = "#{@product.name} was successfully updated!"
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