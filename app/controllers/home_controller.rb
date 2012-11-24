class HomeController < ApplicationController
  include InsultsRetriever

  def index

    if params[:filter]
      @filter = params[:filter].split('/')[0]
      set = params[:filter].split('/')[1]
    end

    if @filter == 'new'
      @insults = get_insults_by_age(set)
    else
      @filter = 'top'
      @insults = get_insults_by_rating(set)
    end

    @insult = Insult.new
  end
end
