class InsultsController < ApplicationController
  # GET /insults
  # GET /insults.json
  def index
    @insults = Insult.all

    @insults.each do |i|
      if i.user
        puts i.user.name
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @insults }
    end
  end

  # GET /insults/1
  # GET /insults/1.json
  def show
    @insult = Insult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @insult }
    end
  end

  # GET /insults/new
  # GET /insults/new.json
  def new
    @insult = Insult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @insult }
    end
  end

  # GET /insults/1/edit
  def edit
    @insult = Insult.find(params[:id])
  end

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
        format.html { redirect_to root_path, notice: 'You\'ve successfully joined the ranks of jackassery!' }
      else
        format.json { render json: @insult.errors, status: :unprocessable_entity }
        format.html { redirect_to root_path, notice: 'Your insult must actually exist for it to be insulting.' }
        #format.html { render action: "new" }
      end
    end
  end

  # PUT /insults/1
  # PUT /insults/1.json
  def update
    @insult = Insult.find(params[:id])

    respond_to do |format|
      if @insult.update_attributes(params[:insult])
        format.html { redirect_to @insult, notice: 'Insult was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @insult.errors, status: :unprocessable_entity }
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
