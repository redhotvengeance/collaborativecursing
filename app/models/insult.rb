class Insult < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  belongs_to :user
  
  attr_accessible :insult, :is_flagged, :points

  validates :insult, :presence => true, :format => {:with => /.*\S.*/, :message => "Your insult must actually exist for it to be insulting."}
end
