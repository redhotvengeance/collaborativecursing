class User < ActiveRecord::Base
  has_many :insults, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_many :flags, :dependent => :destroy

  attr_accessible :email, :name, :password, :password_confirmation, :points, :verification, :is_verified

  validates :email, presence: true, uniqueness: true, :format => { :with => /.+@.+\..+/}
  validates :name, presence: true, uniqueness: true

  has_secure_password
end
