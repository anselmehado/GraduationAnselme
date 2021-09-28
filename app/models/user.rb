class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorites, dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :visits, class_name: "Ahoy::Visit"


  def self.guest
        find_or_create_by!(email: 'guest@example.com') do |user|
          user.name = 'guests'
          user.password = SecureRandom.urlsafe_base64
        end
      end

      def self.admin_guest
        find_or_create_by!(email: 'admin_guest@example.com') do |user|
          user.name = 'Guest administrator'
          user.password = SecureRandom.urlsafe_base64
          user.user_role = 'admin'
        end
  end

end
