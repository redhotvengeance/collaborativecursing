module PointsCalculator
  def tally_user_points(user_id)
    begin
      user = User.find(user_id)
      user_points = 0

      user.insults.each do |i|
        user_points += i.points.to_i
      end
      
      user.points = user_points
      user.save!
    rescue
      "user points tally failed"
    end
    
  end

  def tally_insult_points(insult_id)
    begin
      insult = Insult.find_by_id(insult_id)

      insult_points = 0

      insult.votes.each do |v|
        insult_points += v.value.to_i
      end

      insult.points = insult_points
      insult.save!

      insult_points
    rescue
      "insult points tally failed"
    end
  end
end
