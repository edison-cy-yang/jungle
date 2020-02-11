require 'rails_helper'

RSpec.feature "Visitor navigates to a product from the home page", type: :feature, js: true do
  #Setup
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "They see one product detail" do
    visit root_path
    # save_screenshot

    page.first('article.product img').click
    page.find('.products-show')
    # save_screenshot
    
  end
end
