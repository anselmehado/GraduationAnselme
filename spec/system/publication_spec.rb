require 'rails_helper'
RSpec.describe 'publication management function', type: :system do
  before do
    FactoryBot.create(:publication)
    @user = FactoryBot.create(:user)
  end

  describe 'New creation function' do
    before(:each) do
    visit root_path
  end

  context 'When creating a new publication' do
    it 'The created publication is displayed' do
      visit sessions_new_path
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_button "Login"
      visit new_publication_path
      fill_in 'publication', with: 'publication'

      click_button "Register"
      expect(page).to have_content 'publication'

    end
  end
end

describe 'List display function' do
  before do
    visit sessions_new_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button "Login"
  end

  context 'When transitioning to the list screen' do
    it 'The created publication list is displayed' do
      publication = FactoryBot.create(:publication, title: 'publication')
      visit publications_path
      expect(page).to have_content 'publication'
    end
  end


  describe 'Detailed display function' do
  before do
    visit sessions_new_path
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button "Login"
  end
end
   context 'When transitioned to any publication details screen' do
     it 'The content of the relevant publication is displayed' do
      publication = FactoryBot.create(:publication, title: 'publication')
      visit task_path(publication.id)
      expect(page).to have_content 'publication'
     end
   end
end
end
