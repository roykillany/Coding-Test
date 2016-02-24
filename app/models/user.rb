class User < ActiveRecord::Base
	validates :username, :session_token, :password_digest, :email, presence: true
	validates :password, length: { minimum: 6, allow_nil: true }
	validates :username, :email, uniqueness: true

	has_one :cart
	has_many :products, through: :cart

	attr_reader :password
	after_initialize :ensure_session_token
	after_create :create_cart

	def self.find_by_credentials(username, password)
		user = User.find_by_username(username)
		return nil unless user && user.is_password?(password)
		user
	end

	def reset_session_token
		self.session_token = User.generate_session_token
		self.save!
		self.session_token
	end

	def ensure_session_token
		self.session_token ||= User.generate_session_token
	end

	def self.generate_session_token
		SecureRandom.urlsafe_base64
	end

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def is_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def create_cart
		self.cart = Cart.new({user_id: self.id})
		begin
			self.cart.save!
		rescue => e
			p "***create_cart***"
			p e.message
			p e.backtrace
		end
	end
end