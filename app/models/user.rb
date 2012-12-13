class User < ActiveRecord::Base
  has_many :insults, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_many :flags, :dependent => :destroy

  attr_accessible :email, :name, :password, :password_confirmation, :points, :verification, :is_verified

  validates :email, presence: true, uniqueness: true, :format => { :with => /.+@.+\..+/}
  validates :name, presence: true, uniqueness: true

  has_secure_password

  def self.calculate_points(user_id)
    user = find_by_id user_id

    if (user)
      user_points = 0

      user.insults.each do |i|
        user_points += i.points.to_i
      end
      
      user.points = user_points
      user.save!
    end
  end
end
