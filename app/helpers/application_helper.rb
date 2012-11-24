module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_nav_item(name)
    "on" if @filter == name
  end

  def user_vote(insult)
    user = session[:user_id]
    
    vote = ''

    insult.votes.each do |v|
      if (v.user_id == user)
        if (v.value == 1)
          vote = 'up'
        else
          vote = 'down'
        end
      end
    end

    vote
  end
end
