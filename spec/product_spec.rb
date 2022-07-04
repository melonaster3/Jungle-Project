require 'rails_helper'

RSpec.describe Product, type: :model do

  before :each do

    @category = Category.new name: 'test'

  end

  describe 'Validations' do

    it 'Should save the 4 product information correctly' do  
      @product = Product.new(name: 'greenTree', price: 200, quantity: 20, category: @category)
      @product.save
      expect(@product).to be_present
    end

    it 'Cannot be validated if no name' do 
      @product1 = Product.new(name: nil, price: 200, quantity: 20, category: @category)
      expect(@product1).to_not be_valid
      expect(@product1.errors.full_messages).to include("Name can't be blank")
    end

    it 'Cannot be validated if no price is present' do 
      @product2 = Product.new(name: 'catTree', price_cents: nil, quantity: 20, category: @category)
      expect(@product2).to_not be_valid
      expect(@product2.errors.full_messages).to include("Price can't be blank")
    end

    it 'Cannot be validated if no quantity is present' do  
      @product3 = Product.new(name: 'catTree', price: 3444, quantity: nil, category: @category)
      expect(@product3).to_not be_valid
      expect(@product3.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'Cannot be validated if no category is present' do  
      @product4 = Product.new(name: 'catTree', price: 1200, quantity: 20, category: nil)
      expect(@product4).to_not be_valid
      expect(@product4.errors.full_messages).to include("Category can't be blank")
    end

  end

end