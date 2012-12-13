class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  validates :name, presence: true,length: { maximum: 50 }

  
  validates :email, presence: true

# Automatically create the virtual attribute 'password_confirmation'.
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }

end
