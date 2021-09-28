class Users::SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    def guest_sign_in
      user = User.guest
      sign_in user
      redirect_to publications_path, notice: 'You have logged in as a guest user.'
    end

    def admin_guest_sign_in
      guest_user = User.admin_guest
      sign_in guest_user
      redirect_to publications_path, notice: 'You have logged in as an admin guest user.'
    end
  end
