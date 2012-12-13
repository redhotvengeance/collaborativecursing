class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create, :show, :verify]

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @insults = Insult.find_by_user(params[:id], 0, true, nil)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    unless session[:user_id] == params[:id].to_i
      redirect_to user_path(session[:user_id])
    end

    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    @user.verification = SecureRandom.uuid

    respond_to do |format|
      if @user.save
        UserMailer.verification_email(@user).deliver
        
        format.html { redirect_to root_path, notice: "User #{@user.name} was successfully created. Check your email to verify your account." }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def verify
    @user = User.find_by_id(params[:id])

    if @user
      if params[:verification] == @user.verification
        @user.is_verified = true
        if @user.save
          redirect_to login_path, notice: "You've been verified!"
        else
          redirect_to login_path, notice: "Looks like your user verification failed."
        end
      else
        redirect_to login_path, notice: "Looks like your user verification failed."
      end
    else
      redirect_to root_path
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_url(@user), notice: "User #{@user.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_url }
      format.json { head :no_content }
    end
  end
end
