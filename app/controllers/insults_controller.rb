class InsultsController < ApplicationController
  include InsultsRetriever
  include PointsCalculator

  skip_before_filter :authorize, only: [:create]

  # POST /insults
  # POST /insults.json
  def create
    if params[:comment] == ''
      @insult = Insult.new(params[:insult])

      if session[:user_id]
        @insult.user_id = session[:user_id]
      end

      respond_to do |format|
        if @insult.save
          format.json { render json: @insult, status: :created }
          format.html { redirect_to "#{params[:redirect]}", notice: 'You\'ve successfully joined the ranks of jackassery!' }
        else
          format.json { render json: @insult.errors, status: :unprocessable_entity }
          format.html { redirect_to "#{params[:redirect]}", notice: 'Your insult must actually exist for it to be insulting.' }
        end
      end
    else
      redirect_to "#{params[:redirect]}"
    end
  end

  # DELETE /insults/1
  # DELETE /insults/1.json
  def destroy
    @insult = Insult.find(params[:id])
    
    if @insult.user_id
      user_id = @insult.user_id
    end

    @insult.destroy

    if (user_id)
      tally_user_points(user_id)
    end

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end
