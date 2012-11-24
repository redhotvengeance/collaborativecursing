class VotesController < ApplicationController
  def vote
    Vote.transaction do
      if (session[:user_id])
        user_id = session[:user_id]

        if (params[:value] == 'up' || params[:value] == 'down')
          vote_value = 1 if params[:value] == 'up'
          vote_value = -1 if params[:value] == 'down'

          insult_id = params[:insult].to_i
          insult = Insult.find_by_id(insult_id)

          if (insult)
            vote = Vote.find(:first, :conditions => { :insult_id => insult_id, :user_id => user_id }) || Vote.new
            vote.value = vote_value
            vote.insult_id = insult_id
            vote.user_id = user_id
            vote.save!
            
            insult_points = 0

            insult.votes.each do |v|
              insult_points += v.value.to_i
            end

            insult.points = insult_points
            insult.save!

            if (insult.user_id)
              insultor = User.find(insult.user_id)
              insultor_points = 0

              insultor.insults.each do |i|
                insultor_points += i.points.to_i
              end
              
              insultor.points = insultor_points
              insultor.save!
            end

            redirect_to '/'
          else
            redirect_to '/', :alert =>"Stop fucking with things! I'm smarter than you."
          end
        else
          redirect_to '/', :alert =>"Tut, tut. No cheating, now."
        end
      else
        redirect_to '/', :alert =>"You must be logged in to vote!"
      end
    end
  end

  def destroy
    redirect_to '/'
  end
end
