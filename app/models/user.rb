class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email, case_sensitive: false, presence: true
    validates :first_name, :last_name, :email, presence: true
    validates :password, :password_confirmation, presence: true, length: { minimum: 4}
  
    private
  
    def self.authenticate_with_credentials(email, password)
        result = nil 
      if email == nil || password == nil
        result = false
      else
        user_email = email.downcase.strip
        
        user = User.find_by_email(user_email)
        result = user && user.authenticate(password) ? user : false
      end
      result
    end
  end