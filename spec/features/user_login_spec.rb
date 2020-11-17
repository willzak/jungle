require 'rails_helper'

RSpec.feature "Visitor logins into the website", type: :feature, js: true do
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

    @user = User.create!(
      name: 'Celine Dion',
      email: 'celine@dion.com',
      password: 'myheartwillgoon',
      password_confirmation: 'myheartwillgoon'
    )
  end

  scenario "user logs into the website and taken to home page" do
    visit '/login'

    expect(page).to have_css '.login'

    fill_in 'email', with: 'celine@dion.com'
    fill_in 'password', with: 'myheartwillgoon'

    click_on 'Submit'

    expect(page).to have_css 'article.product', count: 10
  end
end
