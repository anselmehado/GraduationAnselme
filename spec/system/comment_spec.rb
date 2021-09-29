require 'rails_helper'
RSpec.feature "Comment management function", type: :feature do
  scenario "Test description list" do
    visit publications_path
  end
  scenario "Test Comment creation" do
    Comment.create(content:"hello world",email:"hello@gmail.com", name:"Ange" )
  end
  scenario 'Test Comment Deletion' do
    publication2=Comment.create(content:"hello world",email:"hello@gmail.com", name:"Ange" )
    publication2.delete
    visit publications_path
  end
  scenario 'Test Comment validation' do
    Comment.create(content:"hello world",email:"hello@gmail.com", name:"Ange" )
    visit publications_path
  end
end