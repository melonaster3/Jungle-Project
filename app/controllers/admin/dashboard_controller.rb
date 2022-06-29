class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV['AUTH_USERNAME'].to_s, password: ENV['AUTH_PASSWORD'].to_s

  def show
 
      @product_count = Product.sum(:quantity)
      @category_count = Product.count(:id)

  end
end
