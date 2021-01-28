class User < ApplicationRecord
  has_and_belongs_to_many :bars, :optional => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :uniqueness => true, :presence => true
  has_secure_password
end
