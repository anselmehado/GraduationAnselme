require 'rails_helper'

RSpec.feature "User management", type: :feature do

  background do
    User.create!(name: "Salih", city: "Dakar", phone: "777348960", role: "Owner", email: 'salih@gmail.com', password: 'salih210')
    User.create!(name: "Nuh", city: "Dakar", phone: "782680097", role: "Owner", email: 'nuh@gmail.com', password: 'nuh210')
    User.create!(name: "Hud", city: "Saint Louis", phone: "768975604", role: "Client", email: 'hud@gmail.com', password: 'hud210')
  end
  scenario "Test number of users" do
      expect(User.all.count).to eq 4
  end
  scenario "Test user details" do
      visit new_user_session_path
      fill_in 'Email', with: 'salih@gmail.com'
      fill_in 'Password', with: 'salih210'
      click_on 'Log in'
      expect(page).to have_content 'Profile'
  end
  scenario "Test owner list" do
      visit new_user_session_path
      fill_in 'Email', with: 'hud@gmail.com'
      fill_in 'Password', with: 'hud210'
      click_on 'Log in'
      visit users_path
      expect(page ).to  have_content  'Salih'
      expect(page ).to  have_content  'Nuh'
  end
  scenario "Test user creation" do
    visit new_user_registration_path
    fill_in 'Name', with: 'Yusuf'
    fill_in 'City', with: 'Dakar'
    fill_in 'Phone', with: '786543209'
    fill_in 'Email', with: 'yusuf@gmail.com'
    fill_in 'Password', with: 'yusuf210'
    fill_in 'Password confirmation', with: 'yusuf210'
    click_on 'Create account'
    expect(User.all.count).to eq 5
  end

  scenario "Test user update" do
    visit new_user_session_path
    fill_in 'Email', with: 'salih@gmail.com'
    fill_in 'Password', with: 'salih210'
    click_on 'Log in'
    visit edit_user_registration_path
    fill_in 'Name', with: 'Saliou'
    fill_in 'City', with: 'Thies'
    fill_in 'Phone', with: '785643209'
    click_on 'Update'
    click_on 'Logout'
    fill_in 'Email', with: 'hud@gmail.com'
    fill_in 'Password', with: 'hud210'
    click_on 'Log in'
    visit users_path
    expect(page ).to  have_content  'Saliou'
  end

  scenario "Test user logout" do
    visit new_user_session_path
    fill_in 'Email', with: 'hud@gmail.com'
    fill_in 'Password', with: 'hud210'
    click_on 'Log in'
    click_on 'Logout'
    expect(current_path).to eq '/users/sign_in'
  end

end
