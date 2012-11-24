class User < ActiveRecord::Base
  has_many :insults
  has_many :votes

  attr_accessible :email, :name, :password, :password_confirmation, :points

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  has_secure_password
end
