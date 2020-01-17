class Product < ApplicationRecord
    validates :name, :cost, :country_of_origin, presence: true
    has_many :reviews, dependent: :destroy

    before_save(:titleize_product)

    private
        def titleize_product
            self.name = self.name.titleize
        end
end