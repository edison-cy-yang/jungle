class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  
  def show
    @count = {
      :total_quantity => Product.sum(:quantity),
      :number_of_categories => Category.count
    }
  end
end
