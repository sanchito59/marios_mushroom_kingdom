class ReviewsController < ApplicationController
    def new
        @product = Product.find(params[:product_id])
        @review = @product.reviews.new 
    end
end