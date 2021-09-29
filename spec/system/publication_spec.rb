require 'rails_helper'
RSpec.feature "publication mandatement function", type: :feature do
  background do
    User.create!( email: 'anslime@gmail.Com',  password: '123456', password_confirmation:'123456')
    visit new_user_session_path
    fill_in 'email', with: 'anselme@gmail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    Publication.create(title:'Toyota', date:'6', content:'pink')
  end
  scenario "Test description list" do
    visit publications_path
  end
  scenario "Test publication creation" do
    Publication.create(title:'Toyota', date:'6', content:'pink')
  end
  scenario "Test publication details" do
    Publication.first
  end
  scenario "Test publication updating" do

    publication=Publication.create(title:'Toyota', date:'6', content:'pink')
    publication.title='Toyota2'
    publication.save
   # save_and_open_pdate
  end
  scenario 'Test publication Deletion' do
    publication2=Publication.create(title:'Toyota', date:'6', content:'pink')
    publication2.delete
    visit publications_path
  end
  scenario 'Test publication validation' do
    Publication.create(title:'Toyota', date:'6', content:'pink')
    visit publications_path
  end
end
