class Insult < ActiveRecord::Base
  has_many :votes, :dependent => :destroy
  has_many :flags, :dependent => :destroy
  belongs_to :user
  
  attr_accessible :insult, :points

  validates :insult, :presence => true, :format => {:with => /.*\S.*/, :message => "Your insult must actually exist for it to be insulting."}

  def self.find_by_rating(index = 0, descending = true, batch = 15)
    all :limit => batch, :offset => index, :order => self.set_order('points', descending)
  end

  def self.find_by_age(index = 0, descending = true, batch = 15)
    all :limit => batch, :offset => index, :order => self.set_order('created_at', descending)
  end

  def self.find_by_user(userID, index = 0, descending = true, batch = 15)
    where("user_id = #{userID}").limit(batch).offset(index).order(self.set_order('points', descending))
  end

  def self.calculate_points(insult_id)
    insult = find_by_id insult_id
    
    if (insult)
      insult_points = 0

      insult.votes.each do |v|
        insult_points += v.value.to_i
      end

      insult.points = insult_points
      insult.save!
    end
  end

  private

  def self.set_order(id, descending)
    if descending == false
      "#{id} asc"
    else
      "#{id} desc"
    end
  end
end
