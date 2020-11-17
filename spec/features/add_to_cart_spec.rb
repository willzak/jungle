require 'rails_helper'

RSpec.feature "Visitors can add product to cart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User clicks the add to cart button and changes cart value" do
    visit root_path

    expect(page).to have_css 'article.product', count: 10
    page.has_content?('My Cart (0)')

    page.first('.product .btn-primary').click

    page.has_content?('My Cart (1)')
  end
end
