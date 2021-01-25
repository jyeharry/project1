class Bar < ApplicationRecord
  has_and_belongs_to_many :users, :optional => true
  validates :bar_id, :uniqueness => true, :presence => true
end
