class HomeController < ApplicationController
  include InsultsRetriever

  skip_before_filter :authorize

  def index

    if params[:filter]
      @filter = params[:filter].split('/')[0]
      set = params[:filter].split('/')[1]
    end

    if @filter == 'new'
      @insults = get_insults_by_age(set)
    elsif @filter == 'mine'
      if (!session[:user_id])
        redirect_to '/login'
      end
      @insults = get_insults_by_user(session[:user_id])
    else
      @filter = 'top'
      @insults = get_insults_by_rating(set)
    end
    
    @insult = Insult.new
  end
end
