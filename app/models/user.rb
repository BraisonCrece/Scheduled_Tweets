class User < ApplicationRecord
  # this option extends the security through the gem BCrypt
  # - Password must be present on creation
  # - Password length should be less than or equal to 72 bytes
  # - Confirmation of password (using a XXX_confirmation attribute)
  # User --> * email:string
  #          * password_digest:string --> hash made automaticly through BCrypt
  #          
  #          * password:string (virtual)
  #          * password_confirmation:string (virtual)
  has_secure_password

  has_many :twitter_accounts # Here we tell Rails that each user can have one or more twitter accounts
                             # and, if the user has twitter accounts we can access them directly from the user model
                             # --> user.twitter_accounts

  # here we are gonna put the validations of our User model
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Must be a valid email address' } # must exist, and must match with the RegExp



end
