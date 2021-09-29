require 'rails_helper'
describe 'User model function', type: :model do
  describe 'User model function' do
    context 'User model function' do
      it 'User model function' do
        user = User.create(name: "", email: "anselime@example.com", password: "password")
      end
    end
    context 'User model function' do
      it 'User model function' do
        user = User.create(name: "a" * 31, email: "anselime@example.com", password: "password")
      end
    end
    context 'User model function' do
      it 'User model function' do
        user = User.create(name: "Diake", email: "", password: "password")
        expect(user).not_to be_valid
      end
    end
    context 'User model function' do
      it 'User model function' do
        user = User.create(name: "Bella", email: "ritired@", password: "password")
        expect(user).not_to be_valid
      end
    end
    context 'User model function２' do
      it 'User model function' do
        user = User.create(name: "elize", email: "ritotaro", password: "password")
        expect(user).not_to be_valid
      end
    end
    context 'User model function' do
      it 'User model function' do
        user = User.create(name: "Bella", email: "anselime@example.com", password: "password")
        user2 = User.create(name: "anselime", email: "anselime@example.com", password: "password2")
        expect(user2).not_to be_valid
      end
    end
    context 'User model function' do
      it 'User model function' do
        user = User.create(name: "Bella", email: "bella@example.com", password: "")
        expect(user).not_to be_valid
      end
    end
    context 'User model function' do
      it 'User model function' do
        user = User.create(name: "Bella", email: "anselime@example.com", password: "a" * 5 )
        expect(user).not_to be_valid
      end
    end
    context 'User model function' do
      it 'User model function' do
        user = User.create(name: "anselime", email: "anselime@example.com", password: "a" * 6 )
        expect(user).to be_valid
      end
    end
  end
end