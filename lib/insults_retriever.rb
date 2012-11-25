module InsultsRetriever
  def get_insults_by_rating(index = 0, descending = true, batch = 15)
    { :insults => Insult.limit(batch).offset(index).order(set_order('points', descending)), :count => Insult.count }
  end

  def get_insults_by_age(index = 0, descending = true, batch = 15)
    { :insults => Insult.limit(batch).offset(index).order(set_order('created_at', descending)), :count => Insult.count }
  end

  def get_insults_by_user(userID, index = 0, descending = true, batch = 15)
    { :insults => Insult.limit(batch).offset(index).order(set_order('points', descending)).where("user_id = #{userID}"), :count => Insult.where("user_id = #{userID}").count }
  end

  private

  def set_order(id, descending)
    if descending == false
      "#{id} asc"
    else
      "#{id} desc"
    end
  end
end
