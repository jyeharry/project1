class User < ApplicationRecord
  has_and_belongs_to_many :bars, :optional => true
  has_secure_password
end
