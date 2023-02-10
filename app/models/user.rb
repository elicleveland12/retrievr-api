class User < ApplicationRecord
    has_secure_password
    has_many :pets
    has_many :devices
    has_many :messages
    has_many :scans
    validates :email, 'valid_email_2/email': { message: "is not a valid email" }
    validates :name, :email, presence: true
    validates_presence_of :password, :if => :password_required?
    validates_length_of :password, :within => 6..20, :allow_blank => true
    validates :email, uniqueness: true
    belongs_to :referrer, :class_name => 'User', foreign_key: 'referral_id', optional: true
    before_create :confirmation_token
    geocoded_by :location
    after_validation :geocode

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

    protected

    def password_required?
        !persisted? || !password.nil?
    end
end
