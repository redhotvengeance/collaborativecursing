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

            Insult.calculate_points(insult_id)

            if (insult.user_id)
              User.calculate_points(insult.user_id)
            end

            redirect_to "#{params[:redirect]}"
          else
            redirect_to "#{params[:redirect]}", :alert =>"Stop fucking with things! I'm smarter than you."
          end
        else
          redirect_to "#{params[:redirect]}", :alert =>"Tut, tut. No cheating, now."
        end
      else
        redirect_to "#{params[:redirect]}", :alert =>"You must be logged in to vote!"
      end
    end
  end

  def destroy
    Vote.transaction do
      if (session[:user_id])
        user_id = session[:user_id]

        insult_id = params[:insult].to_i
        insult = Insult.find_by_id(insult_id)

        if (insult)
          vote = Vote.find(:first, :conditions => { :insult_id => insult_id, :user_id => user_id })

          if (vote)
            vote.destroy

            Insult.calculate_points(insult_id)
            
            if (insult.user_id)
              User.calculate_points(insult.user_id)
            end
          end

          redirect_to "#{params[:redirect]}"
        else
          redirect_to "#{params[:redirect]}", :alert =>"Stop fucking with things! I'm smarter than you."
        end
      else
        redirect_to "#{params[:redirect]}", :alert =>"You must be logged in to vote!"
      end
    end
  end
end
