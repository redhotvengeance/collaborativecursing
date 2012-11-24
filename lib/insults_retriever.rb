module InsultsRetriever
  def get_insults_by_rating(index = 0, descending = true, batch = 25)
    Insult.limit(batch).offset(index).order(set_order('points', descending))
  end

  def get_insults_by_age(index = 0, descending = true, batch = 25)
    puts set_order('created_at', descending)
    Insult.limit(batch).offset(index).order(set_order('created_at', descending))
  end

  def get_insults_by_user(userID, index = 0, descending = true, batch = 25)
    Insult.limit(batch).offset(index).order(set_order(descending)).where("user_id = #{userID}")
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
