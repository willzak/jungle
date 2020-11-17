require 'rails_helper'

RSpec.feature "Visitors can navigate from home to product details page", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'
    @product = Product.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99,
      category: @category
    )
    @products = [@product]
  end

  scenario "User clicks on a product and is redirected to product details page" do
    visit root_path

    click_on 'Details'

    expect(page).to have_css '.products-show'
  end
end
