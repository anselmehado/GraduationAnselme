require 'rails_helper'
RSpec.describe Comment, type: :model do
  it "Validation does not pass if the name is empty" do
    comment = Comment.new(content: '', email:"anselime@gmail.com", name:"anselme")
    expect( comment).not_to be_valid
  end
  it "Validation does not pass if description is empty" do
    comment = Comment.new(content: 'Failure test',email:"anse@gmail.com", name:"")
    expect( comment).not_to be_valid
  end
  it "validation passes If description is described in name and description" do
    comment=Comment.new(content:'True')
  end
end

