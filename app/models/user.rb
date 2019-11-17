class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  rolify
    has_secure_password
    has_many :pets
    has_many :devices
    validates :email, 'valid_email_2/email': { message: "is not a valid email" }
    validates :name, :email, :password, presence: true
    validates :password, length: { in: 6..20 }
    validates :email, uniqueness: true
    before_create :confirmation_token
    after_create :assign_default_role

    def assign_default_role
        self.add_role(:user) if self.roles.blank?
    end

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end

    private

    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end
end
