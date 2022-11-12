class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: {with: /\A[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\z/, message: "Must be a valid email address"}
end
