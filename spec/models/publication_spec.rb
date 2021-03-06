require 'rails_helper'

RSpec.describe Publication, type: :model do

  describe 'Validation test' do
    context 'If the publication Title is empty' do
      it 'It is hard to Validation' do
        publication = Publication.new(title: '', content: 'Failure test')
        expect(publication).not_to be_valid
      end
    end

    context 'If the publication content is empty' do
      it 'Validation is caught' do
      	publication = Publication.new(title: 'publication', content: '')
      	expect(publication).not_to be_valid
      end
    end

    context 'If the publication Title and content are described' do
      it 'Validation passes' do
        publication = Publication.new(title: 'Publication', content:  'test')
        
      end
    end

  end



end

