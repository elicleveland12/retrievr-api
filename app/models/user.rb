class User < ApplicationRecord
    has_secure_password
    has_many :pets
    has_many :devices
    validates :email, 'valid_email_2/email': { message: "is not a valid email" }
    validates :name, :email, :password, presence: true
    validates :password, length: { in: 6..20 }
    validates :email, uniqueness: true
    before_create :confirmation_token

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
