class UsersController < ApplicationController
  def index
    if user_signed_in?
      redirect_to publications_path
    end 

  end
end
