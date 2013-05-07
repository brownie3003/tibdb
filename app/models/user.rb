class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_save :create_remember_token

	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.(gsi|cabinet-office)\.[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :department_id, presence: true
	validates :role, presence: true

	has_secure_password
  	validates :password_confirmation, presence: true
  	validates :password, length: { minimum: 6 }

  	## needs work to assign department rather than string of department on signup
  	belongs_to :department

  	private

  		def create_remember_token
  			self.remember_token = SecureRandom.urlsafe_base64
  		end
end
