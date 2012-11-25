class InsultsController < ApplicationController
  include InsultsRetriever

  # POST /insults
  # POST /insults.json
  def create
    @insult = Insult.new(params[:insult])

    if session[:user_id]
      @insult.user_id = session[:user_id]
    end

    respond_to do |format|
      if @insult.save
        format.json { render json: @insult, status: :created, location: @insult }
        format.html { redirect_to "#{params[:redirect]}", notice: 'You\'ve successfully joined the ranks of jackassery!' }
      else
        format.json { render json: @insult.errors, status: :unprocessable_entity }
        format.html { redirect_to "#{params[:redirect]}", notice: 'Your insult must actually exist for it to be insulting.' }
      end
    end
  end

  # DELETE /insults/1
  # DELETE /insults/1.json
  def destroy
    @insult = Insult.find(params[:id])
    @insult.destroy

    respond_to do |format|
      format.html { redirect_to insults_url }
      format.json { head :no_content }
    end
  end
end
