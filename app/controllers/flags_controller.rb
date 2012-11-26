class FlagsController < ApplicationController
  def flag
    if (session[:user_id])
      user_id = session[:user_id]

      insult_id = params[:insult_id].to_i
      insult = Insult.find_by_id(insult_id)

      if (insult)
        flag = Flag.find(:first, :conditions => { :insult_id => insult_id, :user_id => user_id }) || Flag.new
        flag.insult_id = insult_id
        flag.user_id = user_id
        flag.save

        redirect_to "#{params[:redirect]}"
      else
        redirect_to "#{params[:redirect]}", :alert =>"Stop fucking with things! I'm smarter than you."
      end
    else
      redirect_to "#{params[:redirect]}", :alert =>"You must be logged in to flag an insult."
    end
  end

  def unflag
    if (session[:user_id])
      user_id = session[:user_id]

      insult_id = params[:insult_id].to_i
      insult = Insult.find_by_id(insult_id)

      if (insult)
        flag = Flag.find(:first, :conditions => { :insult_id => insult_id, :user_id => user_id })

        if (flag)
          flag.destroy
        end

        redirect_to "#{params[:redirect]}"
      else
        redirect_to "#{params[:redirect]}", :alert =>"Stop fucking with things! I'm smarter than you."
      end
    else
      redirect_to "#{params[:redirect]}", :alert =>"You must be logged in to flag an insult."
    end
  end
end
