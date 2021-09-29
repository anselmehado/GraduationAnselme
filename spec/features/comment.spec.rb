require 'rails_helper'

RSpec.feature "Comments management", type: :feature do

    background do
        User.create!(name: "Nuh", user_role: "Owner", email: 'nuh@gmail.com', password: 'nuh210')
        User.create!(name: "Hud", user_role: "Client", email: 'hud@gmail.com', password: 'hud210')
    end
    background do
        @user = User.first
        FactoryBot.create(:publication, user_id: @user.id)
        FactoryBot.create(:publication, name: 'publication 02', user_id: @user.id)
        @publication = Publication.last
        Comment.create(publication_id: @publication.id, comment: "Please feel free to contact me")
        Comment.create(publication_id: @publication.id, comment: "Best publication in the world")
    end
    scenario "Test number of comments" do
        expect(Publication.all.count).to eq 2
    end
    scenario "Test comments in publication list" do
        visit new_user_session_path
        fill_in 'Email', with: 'nuh@gmail.com'
        fill_in 'Password', with: 'nuh210'
        click_on 'Log in'
        @publication = Publication.last
        visit publication_path(id: @publication.id)
        expect(page).to have_content 'Best publication in the world'
    end
    scenario "Test comment creation" do
        visit new_user_session_path
        fill_in 'Email', with: 'nuh@gmail.com'
        fill_in 'Password', with: 'nuh210'
        click_on 'Log in'
        Publication.create!(name: "Publication 03", age: "14-07-2019", color: "White", size: "Familial", speed: "100", weight: "75", price: "800", city: "Dakar", power: "250", user_id: @user.id)
        @publication = Publication.last
        Comment.create(publication_id: @publication.id, comment: "Best deal of the year")
        visit publication_path(id: @publication.id)
        expect(page).to have_content 'Best deal of the year'
    end


end
