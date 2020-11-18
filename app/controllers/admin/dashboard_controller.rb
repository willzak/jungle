class Admin::DashboardController < Admin::BaseController

  def show
    @count_products = Product.count
    @count_categories = Category.count
  end

end
