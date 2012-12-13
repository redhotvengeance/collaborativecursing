class HomeController < ApplicationController
  skip_before_filter :authorize

  def index
    @filter = 'top'
    set = 0

    if params[:filter]
      @filter = params[:filter].split('/')[0]
      set = params[:filter].split('/')[1].to_i
    end

    if @filter == 'new'
      @insults = Insult.find_by_age(set)
      total = Insult.count
    elsif @filter == 'mine'
      if (!session[:user_id])
        redirect_to '/login'
      end
      @insults = Insult.find_by_user(session[:user_id], set)
      total = Insult.where("user_id = #{session[:user_id]}").count
    else
      @insults = Insult.find_by_rating(set)
      total = Insult.count
    end

    @batch_current = set
    @batch_previous = set - 15

    if (@batch_previous < 0)
      @batch_previous = 0
    end

    if (set + 15 < total)
      @batch_next = set + 15
    end
    
    @insult = Insult.new

    respond_to do |format|
      format.html
    end
  end
end
