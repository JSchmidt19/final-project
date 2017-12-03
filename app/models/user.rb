class User < ApplicationRecord
   before_save { self.email = email.downcase }
    before_save :encrypt_password

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :second_password, presence: true, length: { minimum: 6 }, allow_nil: true
    
    
    # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
    
    
    
    
    def self.authenticateSecondary(email, second_password="")
 
    user = User.find_by_email(email)

  if user && user.match_password(second_password)
    return user
  else
    return false
  end
end
    
    
    
def match_password(login_password="")
  second_password == BCrypt::Engine.hash_secret(login_password, salt)
end
    
    def encrypt_password
  if second_password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.second_password= BCrypt::Engine.hash_secret(second_password, salt)
  end
end
    
end
