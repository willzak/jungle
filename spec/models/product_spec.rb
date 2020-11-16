require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'that is saves' do
      @product = Product.new
      @category = Category.new

      @product.name = "test"
      @product.price = 100
      @product.quantity = 10
      @product.category = @category
      
      @product.save!
      expect(@product.id).to be_present
    end

    it 'that it has a name' do
      @product = Product.new
      @product.name = "new name"
      expect(@product.name).to be_present
    end

    it 'that it has a price' do
      @product = Product.new
      @product.price = 100
      expect(@product.price).to be_present
    end

    it 'that it has a quantity' do
      @product = Product.new
      @product.quantity = 10
      expect(@product.quantity).to be_present
    end

    it 'that it has a category' do
      @product = Product.new
      @category = Category.new
      @product.category = @category
      expect(@product.category).to be_present
    end
  end
end
