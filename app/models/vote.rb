class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :insult
  
  attr_accessible :value

  validates :insult, :presence => true
  validates :value, :presence => true, :format => {:with => /^(-1|1)$/}
end
