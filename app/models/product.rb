class Product < ApplicationRecord
    scope :product_with_most_reviews, -> {( select("products.id, products.name, count(reviews.id) as reviews_count").joins(:reviews).group("products.id").order("reviews_count DESC").limit(1) )}
    scope :made_in_usa, -> { where(country_of_origin: "United States of America") }
    scope :recently_added, -> { order(created_at: :desc).limit(3)}
    # scope :search, -> (search_term) { where("name like ?", "%#{search_term}%")}

    has_many :reviews, dependent: :destroy
    validates :name, :cost, :country_of_origin, presence: true

    before_save(:titleize_product)

    private
        def titleize_product
            self.name = self.name.titleize
        end
end