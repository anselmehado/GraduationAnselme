
require 'rails_helper'

RSpec.feature "Publication management", type: :feature do
  background do
    User.create!(name: "Nuh",  user_role: "admin", email: 'nuh@gmail.com', password: 'nuh210')
    User.create!(name: "Hud", user_role: "admin", email: 'hud@gmail.com', password: 'hud210')
  end
  background do
      @user = User.first
      FactoryBot.create(:publication, user_id: @user.id)
      FactoryBot.create(:publication, name: 'Publication 02', user_id: @user.id)
  end
  scenario "Test publication list" do
      visit new_user_session_path
      fill_in 'Email', with: 'hud@gmail.com'
      fill_in 'Password', with: 'hud210'
      click_on 'Log in'
      expect(page).to have_content 'Publication 01'
      expect(page).to have_content 'Publication 02'
  end
  scenario "Test publication creation" do
      visit new_user_session_path
      fill_in 'Email', with: 'nuh@gmail.com'
      fill_in 'Password', with: 'nuh210'
      click_on 'Log in'
      Publication.create!(name: "Publication 03", age: "14-07-2019", color: "White", size: "Familial", speed: "150", weight: "75", price: "800", city: "Dakar", power: "250", user_id: @user.id)
      click_on 'Logout'
      fill_in 'Email', with: 'hud@gmail.com'
      fill_in 'Password', with: 'hud210'
      click_on 'Log in'
      expect(page).to have_content 'Publication 03'

  end

  scenario "Test whether publications are arranged in descending order of creation date" do
      visit new_user_session_path
      fill_in 'Email', with: 'hud@gmail.com'
      fill_in 'Password', with: 'hud210'
      click_on 'Log in'
      expect(page.text.index("Publication 02")).to be < page.text.index("Publication 01")
  end
  scenario "Test sorting by price" do
      visit new_user_session_path
      fill_in 'Email', with: 'hud@gmail.com'
      fill_in 'Password', with: 'hud210'
      click_on 'Log in'
      click_on 'Sort by price'
      assert Publication.all.order('price')
  end
  scenario "Test sorting by age" do
    visit new_user_session_path
    fill_in 'Email', with: 'hud@gmail.com'
    fill_in 'Password', with: 'hud210'
    click_on 'Log in'
    click_on 'Sort by age'
    assert Publication.all.order('age DESC')
  end
end
