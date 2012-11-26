class Insult < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  has_many :flags, :dependent => :destroy
  belongs_to :user
  
  attr_accessible :insult, :points

  validates :insult, :presence => true, :format => {:with => /.*\S.*/, :message => "Your insult must actually exist for it to be insulting."}
end
